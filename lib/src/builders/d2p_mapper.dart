import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../unils/extensions.dart';
import '../unils/header.dart';

///
base class D2PMapperBuilder extends Builder with ValueReader {
  D2PMapperBuilder(this.options);
  final BuilderOptions options;

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    // Check if the input resource is a library.
    if (!await resolver.isLibrary(buildStep.inputId)) return;

    // final AssetId inputAssetId = buildStep.inputId;
    final libElement = await buildStep.inputLibrary;
    //
    final libReader = LibraryReader(libElement);
    // Get all annotated elements in the library.
    // Filter annotated elements that have the 'createMappers' annotation set to true.
    final annotatedElements =
        libReader.selectClassesAndEnums().where((e) => e.annotation.read('createMappers').boolValue == true);
    // If there are no annotated elements, return.
    if (annotatedElements.isEmpty) return;
    //
    final buf = StringBuffer();

    buf
      ..writeln("import 'dart:convert';")
      ..writeln("import 'package:exap/src/generated/messages.pb.dart';")
      ..writeln("import '${buildStep.inputId.uri}';");
    //
    final classes2 = classes(annotatedElements);
    //
    final enums2 = enums(annotatedElements);

    [ClassBuilder(classes2).content(), EnumBuilder(enums2).content()].nonNulls.forEach(buf.writeln);
    //
    if (buf.isEmpty) return;
    //
    final lineCount = '\n'.allMatches(buf.toString()).length;
    // If the line count is greater than 3,
    // write the generated code to a file.
    if (lineCount > 3) {
      final result = buf.toString();
      buf.clear();
      return await _createFile(buildStep, result);
    }
  }

  /// Writes the generated mapper code to a file.
  Future<void> _createFile(BuildStep buildStep, String result) async => buildStep
      .writeAsString(
        buildStep.inputId.changeExtension(OutputFormats.mapperDart.val),
        result,
      )
      .onError(
        (error, stackTrace) => throw switch (error) {
          InvalidOutputException _ => throw InvalidOutputException(buildStep.inputId, result),
          final PackageNotFoundException e => throw PackageNotFoundException('${e.name}'),
          _ => throw Exception('$runtimeType\nerror $error\n$stackTrace')
        },
      );

  ///
  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': <String>[OutputFormats.mapperDart.val],
      };
}

///
abstract final class MapperGene<T> {
  final T element;
  const MapperGene(this.element);
  String? content();
}

///
base class ClassBuilder extends MapperGene<Map<String, List<ConstructorElement>>> {
  const ClassBuilder(super.element);
  @override
  String? content() {
    try {
      if (super.element.isEmpty) return null;
      final buf = StringBuffer();
      final fromDto = StringBuffer();
      final toDto = StringBuffer();
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
            final pathToField = '$_pathToField.${constructor.nameOfField}'.trim();
            for (final param in constructor.parameters) {
              final _dataFromDTO = param.type.isIterableValue()
                  ? _iterables(param, false, null, pathToField)
                  : param.type.isDartCoreMap
                      ? _coreMap(param, false, null, pathToField)
                      : _parse(param, param.name, false, pathToField);
              pFrom.writeln(
                '''          ${param.isNamed ? '${param.name}:' : ''} $_dataFromDTO,''',
              );

              //
              final _dataToDTO = param.type.isIterableValue()
                  ? _iterables(param, true, null)
                  : param.type.isDartCoreMap
                      ? _coreMap(param, true, null)
                      : _parse(param, param.name, true);
              pTo.writeln(
                '''          ${param.name} : ${_dataToDTO.trim()},''',
              );
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
              const error = '''
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
              final _dataFromDTO = wrapper(param, false, null);
              fromDto.writeln('''
                            ${param.isNamed ? '${param.name}:' : ''} $_dataFromDTO,''');
              final _dataToDTO = wrapper(param, true, null);
              toDto.writeln(
                '''          ${param.name} : ${_dataToDTO.trim()},''',
              );
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
      final generics = param.type.getGenericTypes();
      final isNullable = param.isOptional ? '?' : '';
      final element = generics.first.element!;
      final fieldName = '$pathToField.${param.name}';
      if (dartDataType.contains(element.displayName)) {
        return innerPath ?? fieldName;
      } else if (element.displayName case 'DateTime') {
        return '''($fieldName$isNullable.isNotEmpty??false)?List<${isToDTO ? 'String' : 'DateTime'}>.from($fieldName!.map((e)=>${_dateTime(isToDTO, param.isOptional == '?', 'e')},)):[]''';
      } else {
        switch (generics.first.element) {
          case ClassElement():
            final cl = generics.first.element as ClassElement;
            final _parametsOfGeneric = cl.constructors.first.parameters;
            final buff = StringBuffer();
            buff.write("${isToDTO ? 'DTO${cl.displayName}' : cl.displayName} (");
            for (var q = 0; q < _parametsOfGeneric.length; q++) {
              final _param = _parametsOfGeneric[q];
              final _optional = _param.isOptional ? '?' : '';
              final val = wrapper(
                _param,
                isToDTO,
                '$pathToField$_optional.${_param.name}',
              );
              final _name = isToDTO ? '${_param.name} ' : '''${_param.isNamed ? '${_param.name}' : ''}''';
              buff.write('''$_name : $val,''');
            }
            buff.write(')');
            final typeOfIterable = param.type.element?.displayName;
            final generic = isToDTO ? '$prefixMsg${generics.first}' : '${generics.first}';
            return '''($fieldName$isNullable.isNotEmpty??false)?
          $typeOfIterable<$generic>.from($fieldName!.map<$generic>(($_pathToField)=>${buff.toString()},),):
          []''';
          case EnumElement():
            final enumField = generics.first.element as EnumElement;
            final _dto = enumField.constructors.first.dtoMsgName;
            final _className = enumField.constructors.first.displayName;
            return isToDTO
                ? '$_dto.values.firstWhere((e) => e.name.toUpperCase() == enumField.name.toUpperCase())'
                : '$_className.values.firstWhere((e) => e.name.toUpperCase() == enumField.name.toUpperCase())';
          default:
            throw Exception('This type ${generics.first.element} is not supported.');
        }
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
    final fieldName = innerPath ?? '$pathToField.${param.name}'; //
    return isToDTO ? 'jsonEncode($fieldName)' : 'jsonDecode($fieldName) as ${param.mapTypeWithGenerics}';
  }

  ///
  String _parse(
    ParameterElement param,
    String? name,
    bool isToDTO, [
    String pathToField = _pathToField,
  ]) {
    final element = param.type.element;
    final isDartType = dartDataType.contains(element?.displayName);

    if (isDartType == true) {
      return '$pathToField.$name';
    } else if ('DateTime' == element?.displayName) {
      return _dateTime(isToDTO, param.isOptional, '$pathToField.${name ?? ''}');
    } else {
      switch (element) {
        case ClassElement():
          final clElement = element;
          final constructor = clElement.constructors.first;
          final buf = StringBuffer();
          isToDTO ? buf.write('$prefixMsg${clElement.name}(') : buf.write('${clElement.name}(');

          for (final param in constructor.parameters) {
            late String val;
            final innerPath = '$pathToField.${name == null || name == '' ? '' : '$name.'}${param.name}';
            if (param.type.element?.displayName == 'DateTime') {
              val = _dateTime(
                isToDTO,
                param.isOptional,
                '$pathToField.$name.${param.name}',
              );
            } else if (param.type.isDartCoreMap) {
              val = _coreMap(param, isToDTO, innerPath, pathToField);
            } else if (param.type.isIterableValue()) {
              val = _iterables(param, isToDTO, innerPath, pathToField);
            } else {
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
  static const List<String> dartDataType = [
    'String',
    'int',
    'bool',
    'num',
    'double',
    'Uint8List',
  ];
}

/// EnumBuilder extends HBuilder
/// for handling EnumElement types.
base class EnumBuilder extends MapperGene<List<ConstructorElement>> {
  const EnumBuilder(super._element);

  // final List<ConstructorElement> _element;
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
}

//
const String _pathToField = 'model';
