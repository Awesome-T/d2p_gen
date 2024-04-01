import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:build/build.dart';
import 'package:d2p_annotation/d2p_annotation.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;

import '../unils/protoc_exeption.dart';
import '../unils/file_utils.dart';
import '../unils/header.dart';

// proto/messages  'lib/generated';
final pathToGenDTOdart = Uri(pathSegments: ['lib', 'generated', 'proto']);

/// A builder class responsible for running the `protoc`
/// compiler to generate Dart code from protobuf files.
class ProtocRunner extends Builder {
  @override
  Map<String, List<String>> get buildExtensions => <String, List<String>>{
        OutputFormats.gProto.val: <String>[
          OutputFormats.cMp.val,
          OutputFormats.cTest.val,
        ]
      };

  @override
  FutureOr<void> build(final BuildStep buildStep) async {
    try {
      // Count imports
      final _impCounting = await _imports([
        pathToGenDTOdart.pathSegments.first,
        'src',
      ]);

      // Create test directory if it doesn't exist
      testDirCreateIfNotExist();

      if (_impCounting == null) return;

      // Upgrade pubspec.yaml
      await upgradePubspec();

      await activateProtoc();

      // Run protoc
      await runProtoC();

      // Create counter files
      final _util = FideTmpUtils(buildStep.inputId.package);
      await _util.createFileCounter(OutputFormats.cMp.val, _impCounting);
      await _util.createFileCounter(OutputFormats.cTest.val, _impCounting);
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  ///
  void testDirCreateIfNotExist() {
    // Define the path to the tests directory
    try {
      final pathToTests =
          [Directory.current.path, 'test'].join(Platform.pathSeparator);

      // Create a directory object for the tests directory
      final dirTests = Directory(pathToTests);

      // Create the tests directory if it doesn't exist
      if (!dirTests.existsSync()) {
        dirTests.createSync(recursive: true);
      }
    } on Exception catch (e) {
      exitWitErrorCode('$e');
    }
  }

  ///
  Future<void> activateProtoc() async {
    const _f = 'dart pub global activate protoc_plugin';
    final p = Platform.isWindows
        ? await Process.run('cmd', ['/c', _f])
        : await Process.run('bash', ['-c', _f]);
    if (p.exitCode != 0) {
      final errorMessage = p.stderr;
      exitWitErrorCode(
          '\n${'activate protoc_plugin exit code: ${p.exitCode}\nmessage: $errorMessage\n${StackTrace.current}'}');
    }
  }

  /// Identify and collect import statements
  Future<String?> _imports(final List<String> dirs) async {
    try {
      //? final resourceProvider = PhysicalResourceProvider.INSTANCE;
      final _currentDir = Directory.current.path;
      final _s = Platform.pathSeparator;
      // *
      final _dirs = dirs.fold<List<Directory>>(<Directory>[],
          (final List<Directory> e, final String r) {
        final dir = Directory(<String>[_currentDir, r].join(_s));
        if (dir.existsSync()) e.add(dir);
        return e;
      });

      final dartFile = Glob('**.dart');
      final allFiles = <File>[];
      _dirs.forEach((final dir) => allFiles.addAll(dir
              .listSync(recursive: true)
              .whereType<File>()
              .expand((final File _file) {
            late final f = <File>[];
            if (dartFile.matches(_file.path)) f.add(_file);
            return f;
          })));
      final buf = StringBuffer();
      allFiles.forEach((final file) {
        final visitor = AnnVisitor();
        parseString(content: file.readAsStringSync())
            .unit
            .visitChildren(visitor);
        if (visitor.annotations.isNotEmpty) buf.writeln(p.relative(file.path));
      });
      if (buf.isEmpty) return null;
      final result = buf.toString();
      return result;
    } on Exception catch (e, trace) {
      stderr.writeln(e);
      throw Exception('$e\n$trace');
    }
  }

  /// Upgrades the `pubspec.yaml` file by adding necessary dependencies
  /// related to localization (flutter_localizations, intl) and code generation.
  /// Also adds the `generate: true` flag.
  Future<void> upgradePubspec() async {
    try {
      final yamlPath = '${Directory.current.path}/pubspec.yaml';
      final pubspecFile = File(yamlPath);
      final lines = pubspecFile.readAsLinesSync();

      // Check if 'protobuf' dependency is already included
      final hasProtobuf =
          lines.any((line) => line.contains(RegExp('(  protobuf:){1}')));
      if (hasProtobuf) return;

      // Find the position to add 'protobuf' dependency
      var insertIndex =
          lines.indexWhere((line) => line.contains(RegExp('^dependencies:'))) +
              1;
      if (insertIndex == 0) {
        // 'dependencies:' line not found, add at the end of the file
        insertIndex = lines.length;
      }

      // Insert 'protobuf' dependency
      lines.insert(insertIndex, '  protobuf:');

      // Write modified lines back to the file
      final buf = StringBuffer();
      lines.forEach(buf.writeln);
      await File(yamlPath).writeAsString(buf.toString());
    } on Exception catch (e) {
      exitWitErrorCode('$e');
    }
  }

  /// Runs `flutter pub get` command and returns `true`
  /// if successful, `false` otherwise.
  Future<void> pubGet() async {
    return Process.run(
      'dart',
      <String>['pub', 'get'],
      runInShell: true,
    ).then((final ProcessResult result) =>
        (result.exitCode != 0) ? exitWitErrorCode('''
\n
The required protobuf package could not be downloaded.
Try to add the necessary protobuf dependency https://pub.dev/packages/protobuf
This is needed to generate DTO dart classes.
''') : null);
  }
}

/// The  method is responsible for executing the protocol buffer
/// compiler `protoc` to generate Dart code from` .proto` files.
Future<void> runProtoC() async {
  // Create the output directory if it doesn't exist
  final outputDirectory = Directory(PATH_TO_DTO);
  if (!outputDirectory.existsSync()) {
    outputDirectory.createSync(recursive: true);
  }

  // Define the directory where the .proto files are located
  final _dirProto = [
    Directory.current.path,
    OIDir.exportedProto.val.split('/').first
  ].join(Platform.pathSeparator);

  // Define the path to the input .proto file
  final _pathToProto = <String>[Directory.current.path, OIDir.exportedProto.val]
      .join(Platform.pathSeparator);

  // Specify the output directory for the generated files
  final protocArgs = <String>[
    '--proto_path=$_dirProto',
    '--dart_out=grpc:$PATH_TO_DTO',
    _pathToProto
  ];

  // Start the protoc process
  final process = await Process.start('protoc', protocArgs);

  // Wait for the process to complete
  final exitCode = await process.exitCode;
  // If the process exits with an error, activate the protoc_plugin and display an error message
  if (exitCode != 0) {
    final errorMessage = await utf8.decoder.bind(process.stderr).join();
    exitWitErrorCode(
        '\n${'activate protoc_plugin exit code: $exitCode\nmessage: $errorMessage\n${StackTrace.current}'}');
  }
}

/// A visitor class to traverse the AST and collect annotations with specific criteria.
class AnnVisitor extends RecursiveAstVisitor<void> {
  final List<String> annotations = <String>[];

  @override
  void visitAnnotation(Annotation node) {
    // Check if the annotation name is '$ProtoGen' and contains 'createMappers: true'
    if (node.name.name == '$ProtoGen' &&
        node.toSource().contains(RegExp('createMappers: true'))) {
      annotations.add(node.toSource());
    }
    super.visitAnnotation(node);
  }
}
