import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';

/// A builder class responsible for running the `protoc`
///
/// compiler to generate Dart code from protobuf files.
class PtotocRunner extends Builder {
  final BuilderOptions options;
  PtotocRunner(this.options);
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    // Create the directory for generated Dart files
    //if it doesn't exist
    final generatedDir = Directory('lib/src/generated');
    if (!generatedDir.existsSync()) generatedDir.createSync();

    // Start the process to run protoc compiler
    final process = await Process.start('protoc', [
      // Specify the proto path
      '--proto_path=proto',
      // Specify the output directory for generated Dart files
      '--dart_out=grpc:${generatedDir.path}',
      // Input proto file path
      buildStep.inputId.path,
    ]);

    // Redirect stderr output of the process to the standard error stream
    process.stderr.transform(utf8.decoder).listen(stderr.writeln);

    // Wait for the process to complete
    final exitCode = await process.exitCode;

    // Output the exit code of the process
    stdout.writeln('Exit code: $exitCode');
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        // Define the build extensions mapping
        // For each input file with extension "messages.proto",
        // generate a corresponding output file with extension ".ds.dart"
        'messages.proto': ['.ds.dart'],
      };
}
