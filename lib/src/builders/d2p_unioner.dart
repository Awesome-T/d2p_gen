import 'dart:async';

import 'package:build/build.dart';
import 'package:d2p_gen/src/unils/header.dart';
import 'package:glob/glob.dart';

/// A builder class for generating union protocol buffer files.
class D2pUnionBuilder implements Builder {
  D2pUnionBuilder(this.options);
  final BuilderOptions options;

  /// Method for handling the creation of protocol buffer files.
  Future<void> _generateProto(BuildStep buildStep) async {
    final StringBuffer buf = StringBuffer();
    late Uri uriNew;
    final Glob protoGlob = Glob('**/*${OutputFormats.tmpProto.val}');
    final Stream<AssetId> protoExports = buildStep.findAssets(protoGlob);

    await for (final AssetId assetId in protoExports) {
      uriNew = assetId.uri.replace(path: OIDir.exportedProto.val);
      if (buf.isEmpty)
        buf
          ..writeln(header)
          ..writeln('''
/*
  GENERATE classes
  0. dart pub global activate protoc_plugin
  1. Move create new folder at the root project (MUST be under the lib directory)
  3. Run command :
   
             protoc \
      --proto_path= proto/messages.proto \
      --dart_out=grpc:lib/src/generated 

*/
''');
      final String content = await buildStep.readAsString(assetId);
      buf.writeln(content);
    }
    if (buf.isNotEmpty) {
      final RegExp pattern = RegExp(r'''
.*(\/\/ GENERATED CODE - DO NOT MODIFY BY HAND.*\n\n\/\/.*
    \/\/ Generator: protoTmpBuilder\n *.*)''', multiLine: true);
      final String data = buf.toString().replaceAll(pattern, '');
      buf.clear();
      await buildStep
          .writeAsString(AssetId(buildStep.inputId.package, uriNew.path), data)
          .onError((error, stackTrace) => throw Exception('$error'));
    }
  }

  @override
  Future<void> build(BuildStep buildStep) async =>
      _generateProto(buildStep).onError(
        (error, stackTrace) => throw Exception(
          '$error\n$stackTrace',
        ),
      );
  @override
  final Map<String, List<String>> buildExtensions = <String, List<String>>{
    OIDir.root.val: [
      'proto/messages${OutputFormats.proto.val}',
     'proto/warnings.log',
    ]
  };
}
