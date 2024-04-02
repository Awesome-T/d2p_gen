import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';

import '../unils/header.dart';
import '../unils/protoc_exeption.dart';

/// The UnionProtoBuilder class, implementing the Builder interface,
/// facilitates the automated generation of proto files during the
/// build process. It searches for proto files matching a specified
/// pattern, concatenates their content, and writes the resulting
/// proto content to a designated output directory. Error handling
/// ensures that any exceptions during the build process are caught
/// and appropriately handled, maintaining the integrity of the build
/// pipeline.
class UnionProtoBuilder implements Builder {
  UnionProtoBuilder(this.options);
  final BuilderOptions options;

  @override
  Future<void> build(BuildStep buildStep) async {
    try {
      final buf = StringBuffer();
      late Uri uriNew;
      final protoGlob = Glob('**/*${OutputFormats.tmpProto.val}');
      final protoExports = buildStep.findAssets(protoGlob);
      await for (final AssetId assetId in protoExports) {
        uriNew = assetId.uri.replace(path: OIDir.exportedProto.val);
        if (buf.isEmpty) buf.writeln(header);
        final content = await buildStep.readAsString(assetId);
        buf.writeln(content);
      }
      if (buf.isEmpty) return;
      final pattern = RegExp(r'''
        .*(\/\/ GENERATED CODE - DO NOT MODIFY BY HAND.*\n\n\/\/.*
        \/\/ Generator: protoTmpBuilder\n *.*)''', multiLine: true);
      final data = buf.toString().replaceAll(pattern, '');
      buf.clear();

      return buildStep
          .writeAsString(AssetId(buildStep.inputId.package, uriNew.path), data)
          .onError((error, stackTrace) {
        // throw Exception('$error');
        final errormessage =
            'Exception: $error\n${buildStep.inputId}\n$stackTrace';
        // the shutdown of the builder
        exitWitErrorCode(errormessage);
      });
    } catch (error, stackTrace) {
      final errormessage =
          'Exception: $error\n${buildStep.inputId}\n$stackTrace';
      // the shutdown of the builder
      exitWitErrorCode(errormessage);
    }
  }

  @override
  final Map<String, List<String>> buildExtensions = <String, List<String>>{
    OIDir.root.val: <String>[
      'proto/messages${OutputFormats.gProto.val}',
    ],
  };
}
