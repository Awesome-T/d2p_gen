import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:build/build.dart';
import 'package:path/path.dart' as p;

import '../unils/extensions.dart';
import '../unils/file_utils.dart';
import '../unils/header.dart';
import '../unils/protoc_exeption.dart';
import 'protoc_runner_b.dart';

/// Builder that generates test code based on annotated
/// classes and methods.
///
/// This builder analyzes the input Dart code and generates
/// unit tests for methods annotated with `toDTO`.
///
/// The generated tests include assertions to verify that
/// the output matches the expected format.
///
/// If a method returns an enum, it generates tests to ensure
/// the correct behavior of enum mapping.
base class TestBuilder extends Builder with ValueReader {
  ///
  late final Random _random = Random();

  @override
  Map<String, List<String>> get buildExtensions => {
        OutputFormats.testExIn.val: <String>[
          OutputFormats.testExOut.val,
        ],
      };

  /// Writes the generated test code to a file.
  Future<void> _createFile(
    final BuildStep buildStep,
    final String result,
  ) async {
    final newPathSegments = [
      'test',
      'unit_testing',
      ...buildStep.inputId.pathSegments
          .sublist(0, buildStep.inputId.pathSegments.length - 1),
      '${buildStep.inputId.pathSegments.last.replaceFirst(RegExp(OutputFormats.mapperDart.val), '_test.dart')}'
    ];

    final newPath = p.joinAll(newPathSegments);

    try {
      await buildStep.writeAsString(
          AssetId(buildStep.inputId.package, newPath), result);
    } catch (error) {
      if (error is InvalidOutputException) {
        throw InvalidOutputException(buildStep.inputId, result);
      } else if (error is PackageNotFoundException) {
        throw PackageNotFoundException(error.name);
      } else {
        exitWitErrorCode('$runtimeType\nerror $error');
      }
    }
  }

  /// Automate the formatting and fixing of Dart source
  /// code using Dart's built-in tools.
  Future<void> formattingAndRunTests() async {
    // Define the command to format the code, apply fixes, and run tests
    const command =
        '''dart format . && dart fix --apply && dart test --coverage="coverage" --reporter="github" --file-reporter "json:reports/mapper_tests.json"''';

    // Determine the platform and execute the command accordingly
    final result = Platform.isWindows
        ? await Process.run('cmd', ['/c', command])
        : await Process.run('bash', ['-c', command]);

    // Check the exit code and print the output or error message accordingly
    if (result.exitCode != 0) {
      stderr.writeln('''
Exit with exitCode $exitCode
There are several issues:
${result.stderr}
${result.stdout}
''');
    } else {
      stdout.writeln(result.stdout);
    }
  }

  /// Generates a random value for custom data types
  String _generateCustomValue(
    final Element element,
    final bool isToDTO,
  ) {
    if (element is ClassElement) {
      final buffer = StringBuffer();

      final _constructor = {
        ...element.sealedConstructors,
        ...element.notEmptyConstructors
      }.first;
      late final parrentElement = element.parentElement as ClassElement?;
      bool _useUnion;
      if (isToDTO) {
        _useUnion = false;
        buffer.writeln('${_constructor.displayName} (');
      }
      //
      else {
        final _fieldName = _constructor.name.isEmpty
            ? (parrentElement?.constructors
                    .where((final c) =>
                        c.redirectedConstructor?.displayName ==
                        element.displayName)
                    .firstOrNull
                    ?.name
                    .toLowerCase() ??
                '')
            : _constructor.name;
        final _field =
            _fieldName.isEmpty ? _constructor.nameOfField : _fieldName;
        if (parrentElement != null &&
            parrentElement.isSealed == false &&
            parrentElement.isAbstract == true) {
          final d =
              '${_constructor.dtoMsgName}(\n      $_field : DTO${element.displayName}(';
          _useUnion = true;
          buffer.writeln(d);
        } else if (parrentElement != null &&
            parrentElement.isAbstract == false) {
          final d =
              '${parrentElement.constructors.first.dtoMsgName}(\n    $_field : ${_constructor.dtoMsgName}(';
          _useUnion = true;
          buffer.writeln(d);
        } else if (parrentElement != null && parrentElement.isSealed) {
          final d =
              '${_constructor.dtoMsgName}(\n    $_field : DTO${element.displayName}(';
          _useUnion = true;
          buffer.writeln(d);
        } else if (!element.isAbstract &&
            !_constructor.displayName
                .toLowerCase()
                .endsWith('_Union'.toLowerCase())) {
          final d = '${_constructor.dtoMsgName}(';
          _useUnion = false;
          buffer.writeln(d);
        } else {
          _useUnion = true;
          buffer.writeln(
              '${_constructor.dtoMsgName}(\n  ${_constructor.nameOfField} : DTO${_constructor.displayName}(');
        }
      }
      for (final param in _constructor.parameters) {
        final key = isToDTO
            ? '          ${param.isNamed ? '${param.name}:' : ''}'
            : '          ${param.name} : ';
        final generateValue = _generateValue(param.type, isToDTO);
        buffer.writeln('$key $generateValue,');
      }
      if (_useUnion) {
        buffer.writeln('    )');
      }
      buffer.writeln('  )');
      return buffer.toString();
    }
    //
    else if (element is EnumElement) {
      final _enum = element;
      final fields = _enum.fields.sublist(0, _enum.fields.length - 1);
      final _randIndx = _random.nextInt(fields.length);
      return isToDTO
          ? '${_enum.displayName}.${fields[_randIndx].name}'
          : 'DTO${_enum.displayName}.${fields[_randIndx].name.toUpperCase()}';
    }
    //
    else {
      final errormessage = '$element is not supported';
      // the shutdown of the builder
      exitWitErrorCode(errormessage);
      throw Exception(errormessage);
    }
  }

  ///
  /// Generates a random value based on the given Dart type.
  ///
  String _generateValue(
    final DartType type,
    final bool isToDTO,
  ) {
    try {
      if (type.isContainBaseType) {
        return DataGenerator.dataByType(type, isToDTO);
      } else if (type.isDartCoreMap) {
        return _coreMap(type, isToDTO);
      } else if (type.isIterableValue) {
        return _iterables(type, isToDTO);
      } else {
        return (type.element is ClassElement || type.element is EnumElement)
            ? _generateCustomValue(type.element!, isToDTO)
            : throw Exception(
                '$runtimeType type: ${type.runtimeType} is not supported');
      }
    } on Exception catch (e) {
      final errormessage = '$e';
      // the shutdown of the builder
      exitWitErrorCode(errormessage);
      throw Exception(errormessage);
    }
  }

  ///
  /// Generates a string representation of an iterable for testing purposes.
  ///
  String _iterables(
    final DartType type,
    final bool isToDTO,
  ) {
    final _genericDT = type.allGenericTypes.first;
    late final String _genericStr;

    if (_genericDT.isContainBaseType) {
      _genericStr = (!isToDTO &&
              _genericDT.getDisplayString(withNullability: false) == 'DateTime')
          ? '$String'
          : '${_genericDT.getDisplayString(withNullability: true)}';
      return '<$_genericStr>[]';
    } else {
      if (_genericDT.element is EnumElement) {
        _genericStr = isToDTO
            ? _genericDT.getDisplayString(withNullability: true)
            : 'DTO' + _genericDT.getDisplayString(withNullability: true);
      } else if (_genericDT.element is ClassElement) {
        final _cl = _genericDT.element as ClassElement;
        final _isUnion = _cl.constructors
                    .where((final e) =>
                        !e.displayName.startsWith('_') &&
                        e.parameters.isNotEmpty)
                    .length >
                1 ||
            _cl.isSealed ||
            _cl.constructors.any((final r) =>
                r.redirectedConstructor != null &&
                !r.displayName.startsWith('_'));
        _genericStr = isToDTO
            ? _genericDT.getDisplayString(withNullability: true)
            : _isUnion
                ? 'DTO' +
                    _genericDT.getDisplayString(withNullability: false) +
                    '_Union'
                : 'DTO' + _genericDT.getDisplayString(withNullability: false);
      } else {
        throw Exception(
            'This kind Element is not supported ${_genericDT.element}');
      }
      final item = _generateCustomValue(_genericDT.element!, isToDTO);
      return '<$_genericStr>[$item]';
    }
  }

  ///
  /// Generates a string representation of a map for testing purposes.
  ///
  String _coreMap(
    final DartType type,
    final bool isToDTO,
  ) {
    late final dtKey = type.allGenericTypes.first;
    late final dtValue = type.allGenericTypes.last;
    late final key = _generateValue(dtKey, isToDTO);
    late final value = _generateValue(dtValue, isToDTO);
    late final _map =
        '<${dtKey.getDisplayString(withNullability: true)}, ${dtValue.getDisplayString(withNullability: true)}>{$key:$value,}';
    return isToDTO ? _map : 'jsonEncode($_map,)';
  }

  ///
  /// Generates test cases for the toDTO and fromDTO methods of a class.
  ///
  String _clasesTests(
    final ConstructorElement constructor,
    final String mapperName,
  ) {
    return '''
// Test the toDTO method (which returns a DTO class)
${_classTest(constructor, mapperName, true)}

// Test the fromDTO method (which returns a dart data class or enum)
${_classTest(constructor, mapperName, false)}
''';
  }

  ///
  /// Generates a single test case for a given constructor.
  ///
  String _classTest(
    final ConstructorElement constructor,
    final String mapperName,
    final bool isToDTO,
  ) {
    try {
      // Determine method name based on conversion direction
      late final methodName = isToDTO ? 'toDTO' : 'fromDTO';
      // Determine parameter and return type names based on conversion direction
      late final nameOfInstanceParam = isToDTO ? 'model' : 'dto';
      late final nameOfInstanceReturn = isToDTO ? 'dto' : 'model';
      // Generate custom value for the constructor parameters
      final customValue = _generateCustomValue(
          constructor.enclosingElement.declaration, isToDTO);
      // Determine the name of the return type
      late final nameOfReturnType =
          (!isToDTO) ? constructor.displayName : constructor.dtoNameByChild;

      // Construct the test case string
      final testCase = '''
  test(r'$mapperName.$methodName Output class ${constructor.displayName} should be $nameOfReturnType', () {
  // Arrange - Setup facts, Put Expected outputs or Initialize
  final $nameOfInstanceParam = $customValue;

  // Act - Call the function that is to be tested
  final $nameOfInstanceReturn = $mapperName.$methodName($nameOfInstanceParam);
  
  // Assert - Compare the actual result and expected result
  ${_verifyOutputTest(nameOfReturnType, nameOfInstanceReturn)}
  }
    );
  ''';
      return testCase;
    } on Exception catch (e) {
      // Handle exceptions
      final errormessage = '$e';
      // the shutdown of the builder
      exitWitErrorCode(errormessage);
      throw Exception(errormessage);
    }
  }

  ///
  /// Generates a test case for an enum method.
  ///
  String _enumTests(
    final EnumElement en,
    final String mapperName, [
    final bool isToDTO = true,
  ]) {
    // Determine the name of the enum or DTO enum
    final enumName = isToDTO ? en.name : 'DTO${en.name}';
    // Construct the test case string
    final from = isToDTO ? 'dto' : 'model';
    final to = isToDTO ? 'model' : 'dto';
    final type = isToDTO ? 'DTO${en.name}' : en.name;
    final testCase = '''
test('Output enum \$${en.name} should be \$DTO${en.name}', () {
  final $from = $enumName.values.first;
  final $to = $mapperName.${isToDTO ? 'toDTO' : 'fromDTO'}($from);
  ${_verifyOutputTest(type, to)}
});
''';
    return testCase;
  }

  ///
  /// Verifies the output type of a DTO class.
  ///
  String _verifyOutputTest(
    final String returnType,
    final String nameOfInstance,
  ) =>
      '''
// Check if the output is of the expected type
expect(
  $nameOfInstance,
  TypeMatcher<$returnType>(),
  reason: 'The output should be of type $returnType',
);
// Check if the output is not null
expect(
  $nameOfInstance,
  isNotNull,
  reason: 'The output must not be null',
);
// Check if the output is not an exception
expect(
  $nameOfInstance,
  isNot(isException),
  reason: 'The output must not be an exception',
);
''';

  @override
  FutureOr<void> build(final BuildStep buildStep) async {
    try {
      // Analyze the generated file to extract class and enum elements
      final _classes =
          await analyzeGeneratedFile(p.absolute(buildStep.inputId.path));

      // Get the resolver from the build step
      late final resolver = buildStep.resolver;

      // Check if the input resource is a library
      if (!await resolver.isLibrary(buildStep.inputId)) return;

      // If there are no classes with the desired annotation, return
      if (_classes.isEmpty) return;

      // Create lists and buffers to store imports and generated tests
      late final _arrImports = <ConstructorElement>[];
      late final _buffImports = StringBuffer();
      late final _bufftests = StringBuffer();
      late final _buffMain = StringBuffer();
      late final imports = <Uri?>{};
      late final _allClasses = <ClassElement, (Element, Element)>{};

      // Iterate over each class element
      _classes.forEach(
        (final ClassElement clMapper) async {
          // Extract method information from the class
          final method = clMapper.methods
              .where((final w) =>
                  w.displayName.toLowerCase() != 'toDTO'.toLowerCase())
              .first;
          late final returnType = method.returnType.element;
          late final argument = method.parameters.first.type.element;
          if (returnType != null && argument != null) {
            _allClasses.addAll(
              <ClassElement, (Element, Element)>{
                clMapper: (
                  returnType,
                  argument,
                ),
              },
            );
          }
          // 
          else {
            await runProtoC();
          }
        },
      );

      for (final entry in _allClasses.entries) {
        late final clMapper = entry.key;
        //
        late final dartDataModel = entry.value.$1;
        //
        if (dartDataModel is ClassElement) {
          late final _c = dartDataModel;
          if (_c.isSimpleSingleClass) {
            _arrImports.add(dartDataModel.constructors.first);
            late final bothMethods =
                _clasesTests(_c.constructors.first, clMapper.displayName);
            _bufftests
              ..writeln('''
      group(r'Testing ${clMapper.displayName} methods', (){''')
              ..writeln(bothMethods)
              ..writeln('''      });
                    ''');
          }
          //
          else {
            late Iterable<ConstructorElement> _constructors;
            _constructors = (_c.isSealed)
                ? (_c.sealedConstructors.toList()
                  ..removeWhere((final e) =>
                      e.displayName.startsWith('_') ||
                      e.parameters.isEmpty ||
                      (e.redirectedConstructor?.displayName.startsWith('_') ??
                          false) ||
                      (e.redirectedConstructor?.parameters.isEmpty ?? false)))
                : (_c.constructors
                    .where((final e) =>
                        e.redirectedConstructor != null &&
                        e.redirectedConstructor!.parameters.isNotEmpty &&
                        !(e.redirectedConstructor?.displayName
                                .startsWith('_') ??
                            false))
                    .map((final e) => e.redirectedConstructor!));

            if (_constructors.isEmpty) continue;
            for (var i = 0; i < _constructors.length; i++) {
              final _constructor = _constructors.toList()[i];
              _arrImports.add(_constructor);
              if (i == 0) {
                _bufftests.writeln(
                    '''  group(r'Testing ${clMapper.displayName}', () {''');
              }
              _bufftests
                ..writeln('''
      group(r'Testing ${clMapper.displayName} methods for ${_constructor.displayName}', (){''')
                ..writeln(_clasesTests(_constructor, clMapper.displayName))
                ..writeln('''      });
                    ''');
              if (_constructors.length - 1 == i) {
                _bufftests.writeln('''  });''');
              }
            }
          }
        }
        //
        else if (dartDataModel is EnumElement) {
          final _enum = dartDataModel;
          _bufftests.writeln('''
            group(r'Testing ${clMapper.displayName} methods', (){
              //
              ${_enumTests(_enum, clMapper.displayName)}
              //
              ${_enumTests(_enum, clMapper.displayName, false)}
            });
          ''');
          imports.add(_enum.librarySource.uri);
        } else {
          continue;
        }
        imports.addAll(_arrImports
            .expand<Uri?>((final e) => e.type.allGenericTypes.isNotEmpty
                ? e.type.allGenericTypes
                    .map((final e) => e.element?.library?.source.uri)
                    .where((final Uri? e) =>
                        e?.pathSegments.first == buildStep.inputId.package)
                : [e.library.source.uri].where((final Uri? e) =>
                    e?.pathSegments.first == buildStep.inputId.package))
            .toSet());
      }
      // Generate imports for the tests
      if (_bufftests.isEmpty) return;

      _buffImports
        ..writeln(
            "import 'package:${buildStep.inputId.package}/generated/proto/messages.g.pb.dart';")
        ..writeln("import 'dart:convert';")
        ..writeln("import 'package:test/test.dart';");

      //
      imports.forEach((uri) {
        if (uri?.pathSegments.first == buildStep.inputId.package) {
          final maperUri = Uri(
            pathSegments: <String>[
              ...?uri?.pathSegments.sublist(0, uri.pathSegments.length - 1),
              uri!.pathSegments.last
                  .replaceFirst(RegExp('.dart'), OutputFormats.mapperDart.val)
            ],
          );
          _buffImports
            ..writeln("import 'package:$maperUri';")
            ..writeln("import 'package:${uri.path}';");
        }
        return;
      });

// Generate the main function with tests.
      _buffMain.write('''
  ${_buffImports.toString()}
  void main() {
  ${_bufftests.toString()}
  }
  ''');
      _buffImports.clear();
      _bufftests.clear();
      // Write the generated tests to a file
      await _createFile(buildStep, _buffMain.toString());

      // Decrement the counter for the generated tests
      final isLast = await FideTmpUtils(buildStep.inputId.package)
          .decrementing(OutputFormats.cTest.val);

      if (isLast) {
        // Format the code
        await formattingAndRunTests();
      }
    } on Exception catch (error, stackTrace) {
      final errormessage = '''
error: $error
inputId: ${buildStep.inputId}
stackTrace:
$stackTrace''';
      // the shutdown of the builder
      exitWitErrorCode(errormessage);
      // Handle error when analyzing the file
      throw Exception(errormessage);
    }
  }

  /// method is generate Dart file to extract class elements with specific annotations.
  Future<List<ClassElement>> analyzeGeneratedFile(
      String generatedFilePath) async {
    try {
      final classElements = <ClassElement>[];

      // Create an instance of the analysis context collection
      final collection = AnalysisContextCollection(
        resourceProvider: PhysicalResourceProvider.INSTANCE,
        includedPaths: <String>[
          generatedFilePath,
        ], // Path to the generated file
      );

      // Get the analysis context for the generated file
      final context = collection.contextFor(generatedFilePath);

      // Get the analysis session
      final session = context.currentSession;

      // Get the analysis result of the generated file
      final result = await session.getResolvedUnit(generatedFilePath);

      // Check the type of the result
      if (result is ResolvedUnitResult) {
        // Get the compilation unit (AST unit)
        final unit = result.unit;

        // Create a visitor to traverse the AST nodes
        final visitor = _ClassAnnotationVisitor();

        // Start visiting the AST nodes
        unit.accept(visitor);

        final classesWithAnnotation = <ClassDeclaration>[];

        // Get the classes with the desired annotation
        classesWithAnnotation.addAll(visitor.classesWithAnnotation);

        for (final classDeclaration in classesWithAnnotation) {
          final regExp = RegExp(r'\$Mapper\w*', multiLine: true);
          final Iterable<Match> matches =
              regExp.allMatches(classDeclaration.toString());

          for (final match in matches) {
            if (match.group(0) != null) {
              final className = match.group(0)!;
              final classElement = getClassElement(unit, className);
              if (classElement != null) {
                classElements.add(classElement);
              }
            }
          }
        }
      } else {
        const errormessage =
            'Error: Unable to get analysis of the generated file';
        // the shutdown of the builder
        exitWitErrorCode(errormessage);
        // If the result is not a ResolvedUnitResult, handle the error or take other actions
        throw Exception(errormessage);
      }
      return classElements;
    } catch (e) {
      final errormessage = 'Error analyzing the generated file: $e';
      // the shutdown of the builder
      exitWitErrorCode(errormessage);
      // Handle error when analyzing the file
      throw Exception(errormessage);
    }
  }

  /// Retrieving a ClassElement from a CompilationUnit given the class name.
  ClassElement? getClassElement(CompilationUnit unit, String className) {
    // Find the class with the specified name in the CompilationUnit
    final classElement = unit.declaredElement?.getClass(className);

    // Check if the found element is a ClassElement, return it if it is
    if (classElement is ClassElement) {
      return classElement;
    } else {
      return null;
    }
  }
}

///
/// Helper class for generating random data.
///
abstract base class DataGenerator {
  // Define the set of characters that can be used to generate random strings
  static const String _chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  // Initialize a Random object for generating random values
  static final Random _random = Random();

  // Generate data based on the DartType
  static String dataByType(
    final DartType type, [
    final bool isToDTO = false,
  ]) {
    // Determine the type of data and generate accordingly
    switch (type.getDisplayString(withNullability: false)) {
      case 'String':
        return '${generateString(type)}';
      case 'int':
        return generateInt(type).toString();
      case 'double':
        return generateDouble(type).toString();
      case 'bool':
      case 'num':
        return generateBool(type).toString();
      case 'DateTime':
        return generateDateTime(isToDTO);
      default:
        // Throw an exception for unsupported data types
        final errormessage = 'dataByType $type is not supported';
        // the shutdown of the builder
        exitWitErrorCode(errormessage);
        // Handle error when analyzing the file
        throw Exception(errormessage);
    }
  }

  // Generate a random integer
  static int? generateInt(final DartType type) {
    // Generate a random boolean to determine if the value should be nullable
    final _bR = _random.nextBool();
    // Return null or a random integer based on the nullable condition
    return type.isNullable
        ? (_bR ? _random.nextInt(100) : null)
        : _random.nextInt(100);
  }

  // Generate a random double
  static double? generateDouble(final DartType type) {
    // Generate a random boolean to determine if the value should be nullable
    final _bR = _random.nextBool();
    // Return null or a random double based on the nullable condition
    return type.isNullable
        ? (_bR ? _random.nextDouble() : null)
        : _random.nextDouble();
  }

  // Generate a random date-time value
  static String generateDateTime([final bool isToDTO = false]) {
    // Return DateTime.now() or DateTime.now().toIso8601String() based on the isToDTO parameter
    return isToDTO ? 'DateTime.now()' : 'DateTime.now().toIso8601String()';
  }

  // Generate a random boolean
  static bool? generateBool(final DartType type) {
    // Generate a random boolean
    final _bR = _random.nextBool();
    // Return null or the generated boolean based on the nullable condition
    return type.isNullable ? _bR : _bR;
  }

  // Generate a random string
  static String? generateString(final DartType type) {
    // Generate a random boolean to determine if the value should be nullable
    final _bR = _random.nextBool();
    // Generate a random string
    final _rStr = _generateRandomString();
    // Return null or the generated string based on the nullable condition
    return type.isNullable ? (_bR ? _rStr : null) : _rStr;
  }

  // Generate a random string of characters
  static String _generateRandomString() {
    // Generate a random length for the string
    final length = _random.nextInt(_chars.length);
    // Generate a list of random characters and shuffle them
    final _rStr = List.generate(
        length, (final i) => _chars[_random.nextInt(_chars.length)])
      ..shuffle();
    // Return the shuffled characters as a string enclosed in single quotes
    return "'${_rStr.join()}'";
  }
}

/// A visitor class to traverse the AST and collect class
/// declarations with a specific annotation.
class _ClassAnnotationVisitor extends RecursiveAstVisitor<void> {
  final List<ClassDeclaration> classesWithAnnotation = [];

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    // Check if the class declaration has the @ProtoGen annotation
    classesWithAnnotation.add(node);
    super.visitClassDeclaration(node);
  }
}
