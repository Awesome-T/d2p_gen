import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../unils/extensions.dart';
import '../unils/protoc_exeption.dart';
import '../unils/file_utils.dart';
import '../unils/header.dart';

/// The `MapperBuilder` class implements the `Builder` interface
/// and is responsible for generating mapper code based on annotated
/// elements in the input library. It reads annotations to identify
/// elements that require mapper generation. The class then generates
/// mapper classes for classes and enums marked with the `createMappers`
/// annotation set to true.
/// The `build` method orchestrates the generation process by
/// analyzing annotated elements, creating mapper classes using
/// `MapperClassBuilder` and `MapperEnumBuilder`, and writing the generated
/// code to a file. It also handles imports and ensures proper file
/// extension handling. Error handling is implemented to catch exceptions
/// and provide meaningful error messages. Finally, it checks if the
/// generated code meets a minimum line count threshold before writing
/// it to a file. If successful, it creates a file counter to track the
/// completion of mapper generation.
base class MapperBuilder extends Builder with ValueReader {
  MapperBuilder();

  ///
  @override
  Map<String, List<String>> get buildExtensions => {
        OutputFormats.dart.val: <String>[
          OutputFormats.mapperDart.val,
          OutputFormats.mapperCreated.val,
        ],
      };
  @override
  FutureOr<void> build(final BuildStep buildStep) async {
    try {
      final resolver = buildStep.resolver;
      // Check if the input resource is a library.
      if (!await resolver.isLibrary(buildStep.inputId)) return;

      // final AssetId inputAssetId = buildStep.inputId;
      final libElement = await buildStep.inputLibrary;
      //
      final libReader = LibraryReader(libElement);

      // Get all annotated elements in the library.
      // Filter annotated elements that have the 'createMappers' annotation set to true.
      final annotatedElements = libReader.selectClassesAndEnums().where(
          (final AnnotatedElement e) =>
              e.annotation.read('createMappers').boolValue == true);
      // If there are no annotated elements, return.
      if (annotatedElements.isEmpty) return;

      //
      final buf = StringBuffer();
      final cClasses = extractClassConstructors(annotatedElements);
      final cEmuns = extractEnumConstructors(annotatedElements);
      //
      final outerImports = cClasses.values
          .expand((final List<ConstructorElement> cl) => cl.expand(
              (final ConstructorElement constrictor) => constrictor.parameters.expand(
                  (final ParameterElement e) => e.type.allGenericTypes.isNotEmpty
                      ? e.type.allGenericTypes
                          .map((final e) => e.element?.library?.source.uri)
                          .where((final Uri? e) =>
                              e?.pathSegments.first ==
                              buildStep.inputId.package)
                      : <Uri?>[
                          e.library?.source.uri
                        ].where((final Uri? e) => e?.pathSegments.first == buildStep.inputId.package))))
          .toSet();

      buf
        ..writeln("import 'dart:convert';")
        ..writeln("import '../generated/proto/messages.g.pb.dart';")
        ..writeln("import '${buildStep.inputId.uri}';");
      for (final uri in outerImports) {
        if (uri?.pathSegments.first == buildStep.inputId.package) {
          final maperUri = Uri(pathSegments: [
            ...?uri?.pathSegments.sublist(0, uri.pathSegments.length - 1),
            uri!.pathSegments.last.replaceFirst(
                RegExp('.dart'), buildExtensions.values.first.first),
          ]);
          buf.writeln("import 'package:$maperUri';");
        }
      }

      // writing into buffer
      <String?>[
        MapperClassBuilder(cClasses).content(),
        MapperEnumBuilder(cEmuns).content(),
      ].nonNulls.forEach(buf.writeln);

      //
      if (buf.isEmpty) return;
      //
      final lineCount = '\n'.allMatches(buf.toString()).length;
      // If the line count is greater than 3,
      // write the generated code to a file.
      if (lineCount > 3) {
        final result = buf.toString();
        buf.clear();
        //
        await _createMapperFile(buildStep, result);
        //
        final _util = FideTmpUtils(buildStep.inputId.package);
        final islast = await _util.decrementing(OutputFormats.cMp.val);
        if (islast) {
          await _util.createFileCounter(
            OutputFormats.mapperCreated.val,
            'all mappers are created',
          );
        }
      }
    } on Exception catch (error, stackTrace) {
      throw Exception('Exception: $error\n${buildStep.inputId}\n$stackTrace');
    }
  }

  /// Writes the generated mapper code to a file.
  Future<void> _createMapperFile(BuildStep buildStep, String result) async =>
      buildStep
          .writeAsString(
              buildStep.inputId
                  .changeExtension(buildExtensions.values.first.first),
              result)
          .onError(
            (error, stackTrace) => throw switch (error) {
              InvalidOutputException _ =>
                throw InvalidOutputException(buildStep.inputId, result),
              final PackageNotFoundException e =>
                throw PackageNotFoundException('${e.name}'),
              _ => throw Exception('$runtimeType\nerror $error\n$stackTrace')
            },
          );
}

/// The MapperGene class is an abstract final class that serves
/// as a generic mapper generator. It defines a single field
/// element of type T, which represents the element to be mapped.
/// The constructor MapperGene initializes this field with the
/// provided element. Additionally, it declares an abstract method
/// content() that returns a string representing the content of the
///  mapper. This design allows for the creation of various mapper
/// implementations tailored to specific types by subclassing
/// MapperGene and implementing the content() method accordingly.
abstract final class MapperGene<T> {
  final T element;
  const MapperGene(this.element);
  String? content();
}

/// The MapperClassBuilder class extends the MapperGene base class and specializes
/// in generating mapper classes for converting DTO (Data Transfer Object) objects
/// into model objects and vice versa. It overrides the content() method to generate
/// the mapper classes based on the provided element, which is a map of strings to
/// lists of ConstructorElement. The class dynamically constructs mapper classes
/// based on the constructors provided in the element. It generates conversion
/// methods for each constructor, handling single constructors as well as multiple
/// constructors, where appropriate. Additionally, it provides helper methods for
/// handling various data types, including iterable values, core Dart types, maps,
/// and enums, ensuring comprehensive mapping functionality.
base class MapperClassBuilder
    extends MapperGene<Map<String, List<ConstructorElement>>> {
  MapperClassBuilder(super.element);
  @override
  String? content() {
    try {
      if (super.element.isEmpty) return null;
      final buf = StringBuffer();
      final fromDto = StringBuffer();
      final toDTO = StringBuffer();
      late StringBuffer pTo;
      late StringBuffer pFrom;
      for (final entry in super.element.entries) {
        final constructors = entry.value;
        for (var i = 0; i < constructors.length; i++) {
          final constructor = constructors[i];

          if (i == 0) {
            buf.writeln('''
  /// Mapper that converts a DTO [${constructor.dtoMsgName}] object 
  /// into a Model [${constructor.nameOfInheritedClass}] and back.
  abstract class ${constructor.nameOfMapper} {
    ''');
          }
          //
          if (constructors.length > 1) {
            pTo = StringBuffer();
            pFrom = StringBuffer();

            if (i == 0) {
              fromDto.writeln('''
  /// Converts the model [${constructor.nameOfInheritedClass}]
  /// to the DTO [${constructor.dtoMsgName}].
  static ${constructor.nameOfInheritedClass} fromDTO(${constructor.dtoMsgName} $_pathToField) {
    try {''');
              toDTO.writeln('''
  /// Converts the DTO [${constructor.dtoMsgName}]
  /// to the model [${constructor.nameOfInheritedClass}]
  static ${constructor.dtoMsgName} toDTO(${constructor.nameOfInheritedClass} $_pathToField) {
    try {''');
            }
            toDTO.write('''
      if ($_pathToField is ${constructor.fomDtoRD}) {
        return''');
            fromDto.write('''
      if ($_pathToField.has${constructor.nameOfField[0].toUpperCase()}${constructor.nameOfField.substring(1, constructor.nameOfField.length).toLowerCase()}()) {
        return''');
            //
            final pathToField =
                '$_pathToField.${constructor.nameOfField}'.trim();
            //
            for (final param in constructor.parameters) {
              final _dataFromDTO = param.type.isIterableValue
                  ? _iterables(param, false, null, pathToField)
                  : param.type.isDartCoreMap
                      ? _coreMap(param, false, null, pathToField)
                      : _parse(param, param.name, false, pathToField);
              pFrom.writeln(
                  '''          ${param.isNamed ? '${param.name}:' : ''} $_dataFromDTO,''');

              final _dataToDTO = param.type.isIterableValue
                  ? _iterables(param, true, null)
                  : param.type.isDartCoreMap
                      ? _coreMap(param, true, null)
                      : _parse(param, param.name, true);
              pTo.writeln(
                  '''          ${param.name} : ${_dataToDTO.trim()},''');
            }
            toDTO.write(''' ${constructor.dtoMsgName} (
          ${constructor.nameOfField}:DTO${constructor.showNsmeOfCurrentClass}(
            ${pTo.toString()}
            ),
          );
        }
''');
            fromDto.write(''' ${constructor.displayName}(
            ${pFrom.toString()}
          );
        }
''');
            pTo.clear();
            pFrom.clear();
            if (i == constructors.length - 1) {
              const error = '''
      else {
        throw FormatException('No valid DTO \$$_pathToField');
      }
    $_catchStr
''';
              fromDto.writeln(error);
              toDTO.writeln(error);
              buf
                ..writeln(fromDto.toString())
                ..writeln(toDTO.toString());
              toDTO.clear();
              fromDto.clear();
            }
          }

          //
          if (constructors.length == 1) {
            fromDto.writeln('''
  /// Converts the model [${constructor.nameOfInheritedClass}]
  /// to the DTO [${constructor.dtoMsgName}].
  static ${constructor.nameOfInheritedClass} fromDTO(${constructor.dtoMsgName} $_pathToField) {
    try {
      return ${constructor.nameOfInheritedClass}(''');
            toDTO.writeln('''
  /// Converts the model [${constructor.nameOfInheritedClass}] 
  /// to the DTO [${constructor.dtoMsgName}]
  static ${constructor.dtoMsgName} toDTO(${constructor.nameOfInheritedClass} model){
    try {
      return ${constructor.dtoMsgName}(''');
            for (final param in constructor.parameters) {
              final _outerMapper = unionOuterMapper(param);
              final _dataFromDTO = _outerMapper != null
                  ? _outerMapper.ftom
                  : wrapper(param, false, null);
              fromDto.writeln(
                  '''        ${param.isNamed ? '${param.name}:' : ''} $_dataFromDTO,''');
              final _toM = unionOuterMapper(param);
              final _dataToDTO =
                  _toM != null ? _toM.to : wrapper(param, true, null);
              toDTO.writeln('''          ${param.name} : $_dataToDTO,''');
            }
            fromDto
              ..writeln('        );')
              ..writeln(_catchStr);
            toDTO
              ..writeln('        );')
              ..writeln(_catchStr);
            buf
              ..writeln(fromDto.toString())
              ..writeln(toDTO.toString());
            fromDto.clear();
            toDTO.clear();
          }
          if (i == constructors.length - 1) {
            buf.writeln('''  }
          ''');
          }
        }
      }
      final tr = buf.toString();
      buf.clear();
      return tr;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  /// Method is generate mappings for union types in DTOs.
  ({
    String ftom,
    String to,
  })? unionOuterMapper(final ParameterElement param) {
    if (param.type.element is ClassElement) {
      final cl = param.type.element as ClassElement;
      if (cl.isSealed) {
        final _nullAware = '$_pathToField.${param.name} == null ? null: ';
        final ftom = param.type.isNullable
            ? _nullAware +
                '\$Mapper${cl.name}.fromDTO($_pathToField.${param.name}!)'
            : '\$Mapper${cl.name}.fromDTO($_pathToField.${param.name})';
        final _to = param.type.isNullable
            ? _nullAware +
                '\$Mapper${cl.name}.toDTO($_pathToField.${param.name}!)'
            : '\$Mapper${cl.name}.toDTO($_pathToField.${param.name})';
        return (ftom: ftom, to: _to);
      }
    }
    return null;
  }

  /// Method is responsible for converting a DateTime parameter to or
  /// from its DTO representation.
  String _dateTime(
    final bool isToDTO,
    final ParameterElement param, [
    final String pathToField = _pathToField,
  ]) {
    return isToDTO
        ? '$pathToField${param.type.questionMark}.toIso8601String()'
        : (param.type.isNullable
            ? "$pathToField == '' ? null : DateTime.parse($pathToField)"
            : 'DateTime.parse($pathToField)');
  }

  /// Utility function that abstracts the logic of choosing the appropriate
  /// conversion method based on the type of the parameter.
  String wrapper(
    final ParameterElement param,
    final bool isToDTO,
    final String? innerPath, [
    final String pathToField = _pathToField,
  ]) =>
      param.type.isIterableValue
          ? _iterables(param, isToDTO, innerPath, pathToField)
          : param.type.isDartCoreMap
              ? _coreMap(param, isToDTO, innerPath, pathToField)
              : _parse(param, param.name, isToDTO, pathToField);

  /// handling the conversion of iterable types, such as lists,
  /// to and from DTO representations.
  String _iterables(
    final ParameterElement param,
    final bool isToDTO,
    final String? innerPath, [
    final String pathToField = _pathToField,
  ]) {
    try {
      final generics = param.type.allGenericTypes;
      final element = generics.first.element!;
      final fieldName = '$pathToField.${param.name}';
      // if this core dart data type
      if (_dartDataType.contains(element.displayName)) {
        return innerPath ?? fieldName;
      }
      // this generic Class ot Enun wich came frome project
      else {
        if (element.displayName == 'DateTime') {
          if (!isToDTO) {
            return '''($fieldName.isNotEmpty)?List<DateTime>.from($fieldName.map((e)=>${_dateTime(isToDTO, param, 'e')},),):[]''';
          }
          //
          else {
            final _e = '${param.type.isNullable ? '??false' : ''}';
            final _check =
                '($fieldName${param.type.dartNullableSign}.isNotEmpty$_e)';
            return '''$_check?List<${isToDTO ? 'String' : 'DateTime'}>.from($fieldName${param.type.existOnNullable}.map((e)=>${_dateTime(isToDTO, param, 'e')},),):[]''';
          }
        } else {
          switch (generics.first.element) {
            case ClassElement():
              final cl = generics.first.element as ClassElement;
              final _parametsOfGeneric = cl.constructors.first.parameters;
              final buff = StringBuffer();
              late String _type;
              if (cl.isSealed || cl.isAbstract) {
                _type = isToDTO
                    ? '$prefixMsg${cl.displayName}$postfixUnion'
                    : cl.displayName;
                return '''List<$_type>.from(model.${param.name}.map<$_type>((e) =>\$Mapper${cl.displayName}.${isToDTO ? 'toDTO' : 'fromDTO'}(e),),)''';
              }
              //
              else {
                _type =
                    isToDTO ? '$prefixMsg${cl.displayName}' : cl.displayName;
              }

              buff.write('$_type (');
              for (var q = 0; q < _parametsOfGeneric.length; q++) {
                final _param = _parametsOfGeneric[q];
                final val = wrapper(_param, isToDTO,
                    '$pathToField${_param.type.dartNullableSign}.${_param.name}');
                _param.isNamed ? _param.name : '';
                final _name = isToDTO
                    ? '${_param.name} :'
                    : _param.isNamed
                        ? '${_param.name} :'
                        : '';
                buff.write('''$_name  $val,''');
              }
              buff.write(')');
              final typeOfIterable = param.type.element!.displayName;
              final generic =
                  isToDTO ? '$prefixMsg${generics.first}' : '${generics.first}';

              final _check =
                  '($fieldName${param.type.isNullable ? '?' : ''}.isNotEmpty${param.type.isNullable ? '?? false' : ''})';

              return !isToDTO
                  ? '''($fieldName.isNotEmpty)?
          $typeOfIterable<$generic>.from($fieldName.map<$generic>(($_pathToField)=>${buff.toString()},),):
          []'''
                  : '''$_check?
          $typeOfIterable<$generic>.from($fieldName${param.type.existOnNullable}.map<$generic>(($_pathToField)=>${buff.toString()},),):
          []''';
            case EnumElement():
              final enumField = generics.first.element as EnumElement;
              final _type = isToDTO
                  ? enumField.constructors.first.dtoMsgName
                  : enumField.constructors.first.displayName;
              return '$_type.values.firstWhere((e) => e.name.toUpperCase() == enumField.name.toUpperCase())';
            default:
              final errormessage =
                  'This type ${generics.first.element} is not supported\ntype ${element.displayName}\npath: ${element.librarySource?.uri.path}\n';
              // the shutdown of the builder
              exitWitErrorCode(errormessage);
              throw Exception(errormessage);
          }
        }
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  ///
  String _coreMap(
    final ParameterElement param,
    final bool isToDTO,
    final String? innerPath, [
    final String pathToField = _pathToField,
  ]) {
    final fieldName = innerPath ?? '$pathToField.${param.name}'; //
    return isToDTO
        ? 'jsonEncode($fieldName)'
        : '(jsonDecode($fieldName) as Map).cast${param.mapGenerics}()';
  }

  /// Parsing a parameter element based on certain conditions and
  /// returning the corresponding value.
  String _parse(
    final ParameterElement param,
    final String? name,
    final bool isToDTO, [
    final String pathToField = _pathToField,
  ]) {
    final element = param.type.element;
    final isDartType = _dartDataType.contains(element?.displayName);

    if (isDartType == true) {
      return '$pathToField.$name';
    } else if ('DateTime' == element?.displayName) {
      return _dateTime(isToDTO, param, '$pathToField.${name ?? ''}');
    } else {
      switch (element) {
        case ClassElement():
          final clElement = element;
          final constructor = clElement.constructors.first;
          final buf = StringBuffer();
          isToDTO
              ? buf.write('$prefixMsg${clElement.name}(')
              : buf.write('${clElement.name}(');

          for (final param in constructor.parameters) {
            late String val;
            final innerPath =
                '$pathToField.${name == null || name == '' ? '' : '$name.'}${param.name}';
            //
            if (param.type.element?.displayName == 'DateTime') {
              val =
                  _dateTime(isToDTO, param, '$pathToField.$name.${param.name}');
            } else if (param.type.isDartCoreMap) {
              val = _coreMap(param, isToDTO, innerPath, pathToField);
            }
            //
            else if (param.type.isIterableValue) {
              val = _iterables(param, isToDTO, innerPath, pathToField);
            }
            //
            else {
              val = innerPath;
            }

            final fieldName = isToDTO
                ? '${param.name}:'
                : param.isNamed
                    ? '${param.name}:'
                    : '';
            final row = '$fieldName $val,';

            buf.write(row);
          }
          buf.write(')');
          final result = buf.toString();
          buf.clear();
          return result;
        case EnumElement():
          return isToDTO
              ? '''$prefixMsg${element.name}.values.firstWhere((e) => $pathToField.$name.name.toUpperCase()==e.name.toUpperCase())'''
              : '''${element.name}.values.firstWhere((e) => e.name.toLowerCase()==$pathToField.$name.name.toLowerCase())''';
        default:
          final errormessage =
              'Exception invalid type ${element?.displayName}\npath: ${element?.librarySource?.uri.path}\n';
          // the shutdown of the builder
          exitWitErrorCode(errormessage);
          throw Exception(errormessage);
      }
    }
  }

  /// Template used in error handling. It captures the exception information
  /// in case a FormatException occurs. It has the following structure:
  static const String _catchStr = r"""} on FormatException catch (e, trace) {
    throw FormatException(
      '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }""";

  ///
  static const List<String> _dartDataType = [
    'String',
    'int',
    'bool',
    'num',
    'double',
    'Uint8List'
  ];
}

/// The `MapperEnumBuilder` class extends the `MapperGene` base class
/// and is specifically designed to handle `EnumElement` types.
///
/// Its `content()` method generates mapper classes for converting
/// DTO objects into enum objects and vice versa. For each `EnumElement`
/// provided in the element list, the class dynamically constructs mapper
/// classes.
/// These classes provide methods for converting DTO objects
/// into enum objects and vice versa, ensuring bidirectional conversion
/// functionality.
/// The generated classes use the names of the enum and DTO lasses for
/// clarity and consistency in the mapping process. Additionally,
/// error handling is implemented to catch any format exceptions that may
/// occur during the conversion process.
base class MapperEnumBuilder extends MapperGene<List<ConstructorElement>> {
  const MapperEnumBuilder(super._element);
  @override
  String? content() {
    final _buf = StringBuffer();
    for (var e in element) {
      final constructor = e;

      /// Gets the display name of the class.
      final _className = constructor.displayName;

      /// Gets the display name of the DTO class.
      final _nameOfMapper = constructor.nameOfMapper;
      final _dto = constructor.dtoMsgName;
      _buf.writeln("""
    /// 
    /// Mapper that converts a DTO [$_nameOfMapper] object into a enum [$_className] and back.
    ///
    abstract class $_nameOfMapper {

    ///  
    /// Mapper that converts a DTO [$_nameOfMapper] object into an [Enum] [$_className].
    /// 
    static $_dto toDTO($_className enumField) {
      try {
        return $_dto.values.firstWhere((e) => e.name.toUpperCase() == enumField.name.toUpperCase());
        } on FormatException catch (e, trace) {
          throw FormatException('''Error\n\${e.source}\n\${e.message}\n\$trace''');
          }
      }

    ///  
    /// Mapper that converts a DTO [$_nameOfMapper] object into an [Enum] [$_className].
    /// 
    static $_className fromDTO($_dto enumField) {
      try {
        return $_className.values.firstWhere((e) =>
          e.name.toUpperCase() == enumField.name.toUpperCase());
      } on FormatException catch (e, trace) {
        throw FormatException('''Error\n\${e.source}\n\${e.message}\n\$trace''');
      }
    }
  }
  """);
    }
    return _buf.toString();
  }
}

//
const String _pathToField = 'model';
