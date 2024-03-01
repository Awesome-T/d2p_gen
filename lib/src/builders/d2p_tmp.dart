import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import '../unils/extensions.dart';
import '../unils/header.dart';
import 'package:source_gen/source_gen.dart';

/// A builder class for generating temporary protocol buffer files.
/// This class implements the [Builder] interface.
class D2pTmpBuilder with ValueReader implements Builder {
  /// Builds the temporary protocol buffer file.
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    try {
      final resolver = buildStep.resolver;
      final isLibrary = await resolver.isLibrary(buildStep.inputId);
      if (!isLibrary) return;
      final inputAssetId = buildStep.inputId;
      final libElement = await buildStep.inputLibrary;
      final libReader = LibraryReader(libElement);
      final annotatedElements = libReader.selectClassesAndEnums();

      if (annotatedElements.isEmpty) return;
      final buf = StringBuffer();
      final enums2 = enums(annotatedElements);
      final classes2 = classes(annotatedElements);

      <String?>[
        TmpClasProtoBuilder(classes2).messages,
        TmpEnumsProtoBuilder(enums2).messages,
      ].nonNulls.forEach(buf.writeln);
      if (buf.isEmpty) return;
      final result = buf.toString();
      final copyAssetIdproto =
          inputAssetId.changeExtension(OutputFormats.tmpProto.val);
      return await buildStep.writeAsString(copyAssetIdproto, result);
    } on Exception catch (error, stackTrace) {
      stderr.writeln('Exception: $error\n${buildStep.inputId}\n$stackTrace');
      throw Exception('$error');
    }
  }

  @override
  Map<String, List<String>> get buildExtensions => <String, List<String>>{
        '.dart': [OutputFormats.tmpProto.val]
      };
}

/// Abstract interface for temporary protocol
/// buffer builders.
abstract class _TmpProtoBuilder {
  ///
  String? get messages;
}

/// Builder for class protocol buffers.
base class TmpClasProtoBuilder implements _TmpProtoBuilder {
  const TmpClasProtoBuilder(this._element);
  final Map<String, List<ConstructorElement>> _element;
  @override
  String? get messages {
    if (_element.isEmpty) return null;
    final buf = StringBuffer();
    for (final entry in _element.entries) {
      if (entry.value.toSet().length == 1) {
        final constructor = entry.value.first;
        if (constructor.parameters.isEmpty) return null;
        buf.writeln(constructor.protoMessageCl);
      }
      //
      else {
        final bufUnion = StringBuffer();
        for (var a = 0; a < entry.value.length; a++) {
          final constructor = entry.value[a];
          if (constructor.parameters.isEmpty) return null;
          buf.writeln(constructor.protoMessageCl);
          if (a == 0) {
            bufUnion.writeln('''
/*
 * class: ${entry.oneOfField}
*/
  message ${entry.dtoUnionMsgName}   {
    //single inherited  class of ${entry.key.replaceAll(RegExp(r'\.'), '_')} 
    oneof ${entry.oneOfField} {''');
          }
          bufUnion.writeln('''
       //class ${constructor.fomDtoRD}
       $prefixMsg${constructor.fomDtoRD.replaceAll(RegExp(r'\.'), '_')} ${constructor.nameOfField} = ${a + 1};''');
          if (a == entry.value.length - 1) {
            bufUnion.writeln('''
    }
  }''');
            buf.writeln(bufUnion.toString());
            bufUnion.clear();
          }
        }
      }
    }
    return buf.toString();
  }
}

/// Builder for enum protocol buffers.
base class TmpEnumsProtoBuilder implements _TmpProtoBuilder {
  const TmpEnumsProtoBuilder(this._element);
  final List<ConstructorElement> _element;
  @override
  String? get messages {
    if (_element.isEmpty) return null;
    final buf = StringBuffer();
    for (final constructor in _element) {
      buf.writeln(constructor.protoMessageEn);
    }
    return buf.toString();
  }
}
