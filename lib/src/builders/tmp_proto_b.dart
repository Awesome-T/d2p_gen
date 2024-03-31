// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../unils/extensions.dart';
import '../unils/protoc_exeption.dart';
import '../unils/header.dart';

/// The `TmpProtoBuilder` class is designed to automate the generation of temporary protocol buffer
/// files within a Dart project.
/// It encapsulates the logic necessary to inspect the annotated elements
/// (classes and enums) in the input library, generate corresponding protocol
///  buffer messages, and output them to the designated file format.
/// By implementing the `Builder` interface and extending  `ValueReader`,
/// it seamlessly integrates into the build process,providing developers with
/// a streamlined way to handle protocol buffer file generation without manual intervention.
/// A builder class for generating temporary protocol buffer files. This class
/// implements the [Builder] interface.
base class TmpProtoBuilder with ValueReader implements Builder {
  const TmpProtoBuilder();

  ///
  @override
  Map<String, List<String>> get buildExtensions => <String, List<String>>{
        OutputFormats.dart.val: <String>[
          OutputFormats.tmpProto.val,
        ]
      };

  /// Builds the temporary protocol buffer file.
  @override
  FutureOr<void> build(final BuildStep buildStep) async {
    try {
      late final resolver = buildStep.resolver;
      final isLibrary = await resolver.isLibrary(buildStep.inputId);
      if (!isLibrary) return;
      late final inputAssetId = buildStep.inputId;
      final libElement = await buildStep.inputLibrary;
      late final libReader = LibraryReader(libElement);
      late final annotatedElements = libReader.selectClassesAndEnums();

      if (annotatedElements.isEmpty) return;
      late final buf = StringBuffer();
      late final enums2 = extractEnumConstructors(annotatedElements);
      late final classes2 = extractClassConstructors(annotatedElements);

      <String?>[
        TmpClasProtoBuilder(classes2).messages,
        TmpEnumsProtoBuilder(enums2).messages,
      ].nonNulls.forEach(buf.writeln);

      if (buf.isEmpty) return;
      late final result = buf.toString();
      late final copyAssetIdproto =
          inputAssetId.changeExtension(buildExtensions.values.first.first);
      await buildStep.writeAsString(copyAssetIdproto, result);
    } on Exception catch (error, stackTrace) {
      throw Exception('Exception: $error\n${buildStep.inputId}\n$stackTrace');
    }
  }
}

/// Abstract interface for temporary protocol
/// buffer builders.
abstract final class _TmpProtoBuilder {
  String? get messages;
}

/// The TmpClasProtoBuilder class serves as a builder for generating
/// protocol buffer definitions for classes. It processes a map
/// containing class names and their corresponding constructor elements
/// to construct the proto message definitions. The builder ensures
/// the validity of data types used in the constructors and generates
/// proto message definitions accordingly, handling single classes as
/// well as unions of classes represented by oneofs.
base class TmpClasProtoBuilder implements _TmpProtoBuilder {
  const TmpClasProtoBuilder(this._element);
  final Map<String, List<ConstructorElement>> _element;
  @override
  String? get messages {
    try {
      if (_element.isEmpty) return null;
      late final buf = StringBuffer();
      for (final entry in _element.entries) {
        //
        final hasIlligalType = entry.value.hasIllegalType;
        //
        if (hasIlligalType) {
          errorNotification('''
\n
Exception:
You've illigal data types in this file: ${_element.values.first.first.librarySource.uri} 
For more detail, read documentation: https://pub.dev/documentation/d2p_gen/latest/
''');
        }

        //
        if (entry.value.toSet().length == 1) {
          late final constructor = entry.value.first;
          if (constructor.parameters.isEmpty) return null;

          buf.writeln(constructor.protoMessageCl);
        }
        //
        else {
          late final bufUnion = StringBuffer();
          for (var a = 0; a < entry.value.length; a++) {
            late final constructor = entry.value[a];
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
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}

/// The TmpEnumsProtoBuilder class is designed to generate protocol
/// buffer definitions for enums. It takes a list of constructor
/// elements representing enum values and constructs the proto message
/// definitions accordingly. The builder iterates through each constructor
/// element, generating proto message definitions for each enum value.
/// If the list of constructor elements is empty, indicating no enums
/// are present, it returns null.
base class TmpEnumsProtoBuilder implements _TmpProtoBuilder {
  const TmpEnumsProtoBuilder(this._element);
  final List<ConstructorElement> _element;
  @override
  String? get messages {
    if (_element.isEmpty) return null;
    late final buf = StringBuffer();
    for (var constructor in _element) {
      buf.writeln(constructor.protoMessageEn);
    }
    return buf.toString();
  }
}
