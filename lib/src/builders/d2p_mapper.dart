import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:d2p_gen/src/unils/extensions.dart';
import 'package:d2p_gen/src/unils/header.dart';
import 'package:source_gen/source_gen.dart';

///
base class D2PMapperBuilder extends Builder with ValueReader {
  D2PMapperBuilder(this.options);
  final BuilderOptions options;

  // bool hasProtoAnnotation(Element element) {
  //   for (ElementAnnotation metadata in element.metadata) {
  //     if (metadata.computeConstantValue() != null &&
  //         metadata
  //                 .computeConstantValue()!
  //                 .type!
  //                 .getDisplayString(withNullability: false) ==
  //             'ProtoGen') return true;
  //   }
  //   return false;
  // }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final Resolver resolver = buildStep.resolver;
    // Check if the input resource is a library.
    if (!await resolver.isLibrary(buildStep.inputId)) return;

    // final AssetId inputAssetId = buildStep.inputId;
    final LibraryElement libElement = await buildStep.inputLibrary;
    //
    final LibraryReader libReader = LibraryReader(libElement);
    // Get all annotated elements in the library.
    // Filter annotated elements that have the 'createMappers' annotation set to true.
    final Iterable<AnnotatedElement> annotatedElements = libReader
        .selectClassesAndEnums()
        .where((e) => (e.annotation.read('createMappers').boolValue == true));
    // If there are no annotated elements, return.
    if (annotatedElements.isEmpty) return;
    //
    final buf = StringBuffer();

    buf
      ..writeln("import 'dart:convert';")
      ..writeln("import 'package:exap/src/generated/messages.pb.dart';")
      ..writeln("import '${buildStep.inputId.uri}';");
    //
    final Map<String, List<ConstructorElement>> classes2 =
        classes(annotatedElements);
    //
    final List<ConstructorElement> enums2 = enums(annotatedElements);

    [ClassBuilder(classes2).content(), EnumBuilder(enums2).content()]
        .nonNulls
        .forEach(buf.writeln);
    //
    if (buf.isEmpty) return;
    //
    final int lineCount = '\n'.allMatches(buf.toString()).length;
    // If the line count is greater than 3,
    // write the generated code to a file.
    if (lineCount > 3) {
      final String result = buf.toString();
      buf.clear();
      return await _createFile(buildStep, result);
    }
  }

  /// Writes the generated mapper code to a file.
  Future<void> _createFile(BuildStep buildStep, String result) async =>
      buildStep
          .writeAsString(
            buildStep.inputId.changeExtension(OutputFormats.mapperDart.val),
            result,
          )
          .catchError(
              (Object? error, StackTrace stackTrace) => throw switch (error) {
                    InvalidOutputException _ =>
                      throw InvalidOutputException(buildStep.inputId, result),
                    PackageNotFoundException e =>
                      throw PackageNotFoundException('${e.name}'),
                    _ =>
                      throw Exception('$runtimeType\nerror $error\n$stackTrace')
                  });

  ///
  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': <String>[OutputFormats.mapperDart.val]
      };
}

//////
abstract final class MapperGene<T> {
  final T element;
  const MapperGene(this.element);
  String? content();
}

///
///
base class ClassBuilder
    extends MapperGene<Map<String, List<ConstructorElement>>> {
  const ClassBuilder(Map<String, List<ConstructorElement>> element)
      : super(element);
  @override
  String? content() {
    try {
      if (super.element.isEmpty) return null;
      final StringBuffer buf = StringBuffer();
      final StringBuffer fromDto = StringBuffer();
      final StringBuffer toDto = StringBuffer();
      late StringBuffer pTo;
      late StringBuffer pFrom;
      for (final entry in super.element.entries) {
        final List<ConstructorElement> constructors = entry.value;
        for (int i = 0; i < constructors.length; i++) {
          final ConstructorElement constructor = constructors[i];

          if (i == 0) {
            buf.writeln('''
  /// Mapper that converts a DTO [${constructor.dtoMsgName}] object 
  /// into a Model [${constructor.nameOfInheritedClass}] and back.
  abstract class ${constructor.nameOfMapper} {
    ''');
          }
          if (constructors.length > 1) {
            pTo = StringBuffer();
            pFrom = StringBuffer();
            if (i == 0) {
              fromDto.writeln('''
  /// Converts the model [${constructor.nameOfInheritedClass}]
  /// to the DTO [${constructor.dtoMsgName}].
  static ${constructor.nameOfInheritedClass} fromDTO (${constructor.dtoMsgName} $_pathToField) {
    try {''');
              toDto.writeln('''
  /// Converts the DTO [${constructor.dtoMsgName}]
  /// to the model [${constructor.nameOfInheritedClass}]
  static ${constructor.dtoMsgName} toDto (${constructor.nameOfInheritedClass} $_pathToField) {
    try {''');
            }
            toDto.write('''
      if ($_pathToField is ${constructor.fomDtoRD}) {
        return''');
            fromDto.write('''
      if ($_pathToField.has${constructor.nameOfField[0].toUpperCase()}${constructor.nameOfField.substring(1, constructor.nameOfField.length).toLowerCase()}()) {
        return''');
            final String pathToField =
                '$_pathToField.${constructor.nameOfField}'.trim();
            for (final param in constructor.parameters) {
              final String _dataFromDTO = param.type.isIterableValue()
                  ? _iterables(param, false, null, pathToField)
                  : param.type.isDartCoreMap
                      ? _coreMap(param, false, null, pathToField)
                      : _parse(param, param.name, false, pathToField);
              pFrom.writeln(
                  '''          ${param.isNamed ? '${param.name}:' : ''} $_dataFromDTO,''');

              //
              final String _dataToDTO = param.type.isIterableValue()
                  ? _iterables(param, true, null)
                  : param.type.isDartCoreMap
                      ? _coreMap(param, true, null)
                      : _parse(param, param.name, true);
              pTo.writeln(
                  '''          ${param.name} : ${_dataToDTO.trim()},''');
            }
            toDto.write(''' ${constructor.dtoMsgName} (
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
              var error = '''
      else {
        throw FormatException('No valid DTO \$$_pathToField');
      }
    $_catchStr
''';
              fromDto.writeln(error);
              toDto.writeln(error);
              buf
                ..writeln(fromDto.toString())
                ..writeln(toDto.toString());
              toDto.clear();
              fromDto.clear();
            }
          }
          if (constructors.length == 1) {
            fromDto.writeln('''
  /// Converts the model [${constructor.nameOfInheritedClass}]
  /// to the DTO [${constructor.dtoMsgName}].
  static ${constructor.nameOfInheritedClass} fromDTO (${constructor.dtoMsgName} $_pathToField) {
    try {
      return ${constructor.nameOfInheritedClass}(''');
            toDto.writeln('''
  /// Converts the model [${constructor.nameOfInheritedClass}] 
  /// to the DTO [${constructor.dtoMsgName}]
  static ${constructor.dtoMsgName} toDTO (${constructor.nameOfInheritedClass} model){
    try {
      return ${constructor.dtoMsgName}(''');
            for (final param in constructor.parameters) {
              final String _dataFromDTO = wrapper(param, false, null);
              fromDto.writeln('''
                            ${param.isNamed ? '${param.name}:' : ''} $_dataFromDTO,''');
              final String _dataToDTO = wrapper(param, true, null);
              toDto.writeln(
                  '''          ${param.name} : ${_dataToDTO.trim()},''');
            }
            fromDto
              ..writeln('        );')
              ..writeln(_catchStr);
            toDto
              ..writeln('        );')
              ..writeln(_catchStr);
            buf
              ..writeln(fromDto.toString())
              ..writeln(toDto.toString());
            fromDto.clear();
            toDto.clear();
          }
          if (i == constructors.length - 1) buf.writeln('''  }
          ''');
        }
      }
      final String tr = buf.toString();
      buf.clear();
      return tr;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  ///
  String wrapper(
    ParameterElement param,
    bool isToDTO,
    String? innerPath, [
    String pathToField = _pathToField,
  ]) =>
      param.type.isIterableValue()
          ? _iterables(param, isToDTO, innerPath, pathToField)
          : param.type.isDartCoreMap
              ? _coreMap(param, isToDTO, innerPath, pathToField)
              : _parse(param, param.name, isToDTO, pathToField);

  ///
  String _iterables(
    ParameterElement param,
    bool isToDTO,
    String? innerPath, [
    String pathToField = _pathToField,
  ]) {
    try {
      final Iterable<DartType> generics = param.type.getGenericTypes();
      final String isNullable = param.isOptional ? '?' : '';
      final Element element = generics.first.element!;
      final String fieldName = '$pathToField.${param.name}';
      if (dartDataType.contains(element.displayName))
        return innerPath ?? fieldName;
      else if (element.displayName case 'DateTime')
        return '''($fieldName$isNullable.isNotEmpty??false)?List<${isToDTO ? 'String' : 'DateTime'}>.from($fieldName!.map((e)=>${_dateTime(isToDTO, param.isOptional == '?', 'e')},)):[]''';
      else
        switch (generics.first.element) {
          case ClassElement():
            final ClassElement cl = (generics.first.element as ClassElement);
            final List<ParameterElement> _parametsOfGeneric =
                cl.constructors.first.parameters;
            final StringBuffer buff = StringBuffer();
            buff.write(
                "${isToDTO ? 'DTO${cl.displayName}' : cl.displayName} (");
            for (int q = 0; q < _parametsOfGeneric.length; q++) {
              final ParameterElement _param = _parametsOfGeneric[q];
              var _optional = _param.isOptional ? '?' : '';
              final String val = wrapper(
                  _param, isToDTO, '${pathToField}$_optional.${_param.name}');
              final String _name = isToDTO
                  ? '${_param.name} '
                  : '''${_param.isNamed ? '${_param.name}' : ''}''';
              buff.write('''$_name : $val,''');
            }
            buff.write(')');
            final String? typeOfIterable = param.type.element?.displayName;
            final String generic =
                isToDTO ? "$prefixMsg${generics.first}" : '${generics.first}';
            return '''(${fieldName}$isNullable.isNotEmpty??false)?
          $typeOfIterable<${generic}>.from(${fieldName}!.map<${generic}>(($_pathToField)=>${buff.toString()},),):
          []''';
          case EnumElement():
            final EnumElement cl = (generics.first.element as EnumElement);
            throw Exception();
          default:
            throw Exception();
        }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  ///
  String _coreMap(
    ParameterElement param,
    bool isToDTO,
    String? innerPath, [
    String pathToField = _pathToField,
  ]) {
    final String fieldName = innerPath ?? '$pathToField.${param.name}'; //
    return isToDTO
        ? 'jsonEncode($fieldName)'
        : 'jsonDecode($fieldName) as ${param.mapTypeWithGenerics}';
  }

  ///
  String _parse(
    ParameterElement param,
    String? name,
    bool isToDTO, [
    String pathToField = _pathToField,
  ]) {
    final Element? element = param.type.element;
    final bool isDartType = dartDataType.contains(element?.displayName);

    if (isDartType == true)
      return '$pathToField.$name';
    else if ('DateTime' == element?.displayName)
      return _dateTime(isToDTO, param.isOptional, '$pathToField.${name ?? ''}');
    else {
      switch (element) {
        case ClassElement():
          final ClassElement clElement = element;
          final ConstructorElement constructor = clElement.constructors.first;
          final StringBuffer buf = StringBuffer();
          isToDTO
              ? buf.write('$prefixMsg${clElement.name}(')
              : buf.write('${clElement.name}(');

          for (final ParameterElement param in constructor.parameters) {
            late String val;
            final String innerPath =
                '$pathToField.${name == null || name == '' ? '' : '$name.'}${param.name}';
            if (param.type.element?.displayName == 'DateTime') {
              val = _dateTime(isToDTO, param.isOptional,
                  '$pathToField.$name.${param.name}');
            } else if (param.type.isDartCoreMap) {
              val = _coreMap(param, isToDTO, innerPath, pathToField);
            } else if (param.type.isIterableValue()) {
              val = _iterables(param, isToDTO, innerPath, pathToField);
            } else {
              val = innerPath;
            }
            final String fieldName = isToDTO
                ? '${param.name}:'
                : param.isNamed
                    ? '${param.name}:'
                    : '';
            final String row = '$fieldName $val,';

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
          throw Exception('Exception ');
      }
    }
  }

  ///
  String _dateTime(
    bool isToDTO,
    bool isNullable, [
    String pathToField = _pathToField,
  ]) =>
      isToDTO
          ? '$pathToField?.toIso8601String()'
          : ("DateTime.${isNullable ? "tryParse($pathToField)" : "parse($pathToField)"}");

  ///
  static const String _catchStr = """} on FormatException catch (e, trace) {
    throw FormatException(
      '''Exception
      \${e.source}
      \${e.message}
      \$trace''',
      );
    }
  }""";

  ///
  static const List<String> dartDataType = [
    'String',
    'int',
    'bool',
    'num',
    'double',
    'Uint8List'
  ];
}

/// EnumBuilder extends HBuilder
/// for handling EnumElement types.
base class EnumBuilder extends MapperGene<List<ConstructorElement>> {
  const EnumBuilder(List<ConstructorElement> _element) : super(_element);

  // final List<ConstructorElement> _element;
  @override
  String? content() {
    final StringBuffer _buf = StringBuffer();
    for (ConstructorElement e in this.element) {
      final ConstructorElement constructor = e;

      /// Gets the display name of the class.
      final String _className = constructor.displayName;

      /// Gets the display name of the DTO class.
      final String _nameOfMapper = constructor.nameOfMapper;
      final String _dto = constructor.dtoMsgName;
      _buf.writeln('''
    /// 
    /// Mapper that converts a DTO [$_nameOfMapper] object into a enum [$_className] and back.
    ///
    abstract class $_nameOfMapper {

    ///  
    /// Mapper that converts a DTO [$_nameOfMapper] object into an [Enum] [$_className].
    /// 
    static $_dto toDTO ($_className enumField) {
      try {
        return $_dto.values.firstWhere((e) => e.name.toUpperCase() == enumField.name.toUpperCase());
        } on FormatException catch (e, trace) {
          throw FormatException("""Error\n\${e.source}\n\${e.message}\n\$trace""");
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
        throw FormatException("""Error\n\${e.source}\n\${e.message}\n\$trace""");
      }
    }
  }
  ''');
    }
    return _buf.toString();
  }

  // @override
  // List<ConstructorElement> get element => _element;
}

//
const String _pathToField = 'model';
