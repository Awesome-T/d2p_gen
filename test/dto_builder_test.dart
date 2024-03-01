import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:d2p_gen/src/builders/d2p_tmp.dart';
import 'package:d2p_gen/src/unils/extensions.dart';
import 'package:d2p_gen/src/unils/header.dart';
import 'package:test/test.dart';

Future<void> main() async {
  late MockValueReader valueReader;
  late LibraryElement library;

  group('Core', () {
    late InMemoryAssetWriter writerIntoMemory;
    late AssetId textAsset;
    late AssetId dartModetAsset;

    setUp(() async {
      valueReader = MockValueReader();
      textAsset = AssetId.parse('foo|some_txt.txt');
      dartModetAsset = AssetId.parse('example|lib/a.dart');
      writerIntoMemory = InMemoryAssetWriter();

      await writerIntoMemory.writeAsString(textAsset, 'some text written here');
      await writerIntoMemory.writeAsString(dartModetAsset, inputSource);
    });

    test('Analyze test code', () async {
      // Resolving the source code of the library
      library = await resolveSource(
          inputSource, (r) async => (await r.findLibraryByName('example'))!);

      // Analyzing test code
      final types = valueReader
          .cls(library.definingCompilationUnit.classes)['Ctypes']!
          .first
          .parameters
          .toSet()
          .toList();

      // Detailed descriptions for each test assertion
      const o = 'optional';
      expect(types.check('String?'), '$o string',
          reason: 'String type should be optional');
      expect(types.check('String'), 'string',
          reason: 'String type should not be optional');
      expect(types.check('int?'), '$o int32',
          reason: 'Int type should be optional');
      expect(types.check('int'), 'int32',
          reason: 'Int type should not be optional');
      // Additional assertions ...
    });

    test('Output file extension', () {
      // Verify the output file extension
      expect(
        dartModetAsset.changeExtension(OutputFormats.tmpProto.val),
        AssetId.parse('example|lib/a${OutputFormats.tmpProto.val}'),
        reason: 'The output file extension should match the expected format',
      );
    });
  });

  group('Testing TmpClasProtoBuilder', () {
    late TmpClasProtoBuilder clasProtoBuilder;
    late Map<String, List<ConstructorElement>> result;

    setUpAll(() async {
      valueReader = MockValueReader();
      library = await resolveSource(
          inputSource, (r) async => (await r.findLibraryByName('example'))!);
      result = valueReader.cls(library.definingCompilationUnit.classes);
    });

    test('Compare class names', () {
      // Compare names of classes
      final _foundedNames = result.keys.toList()..sort();
      final _expect = ['Foo', 'Ctypes', 'FreezedCl', 'Animal', 'AbsFactories']
        ..sort();
      expect(_foundedNames, _expect,
          reason: 'Class names should match the expected list');
    });

    test('All classes are public and have parameters', () {
      // Verify that all classes are public and have parameters
      final hasParams = result.values
          .toList()
          .every((e) => e.every((e) => e.parameters.isNotEmpty));
      expect(hasParams, isTrue,
          reason: 'All classes should be public and have parameters');
    });

    test('DTO message for class', () {
      // Verify DTO message for class
      clasProtoBuilder = TmpClasProtoBuilder({'Foo': result['Foo']!});
      expect(clasProtoBuilder.messages!.contains('message DTOFoo'), isTrue,
          reason: 'DTO message for class Foo should be present');
      // Additional assertions ...
    });

    test('DTO messages for union types', () {
      // Verify DTO messages for union types
      clasProtoBuilder = TmpClasProtoBuilder({'Animal': result['Animal']!});
      expect(clasProtoBuilder.messages!.contains('message DTOAnimal_Union'),
          isTrue,
          reason: 'DTO message for union type Animal should be present');
      // Additional assertions ...
    });
  });

  group('Testing TmpEnumsProtoBuilder', () {
    late List<ConstructorElement> result;
    late TmpEnumsProtoBuilder enumsProtoBuilder;

    setUpAll(() async {
      valueReader = MockValueReader();
      library = await resolveSource(
          inputSource, (r) async => (await r.findLibraryByName('example'))!);
      result = valueReader.enms(library.definingCompilationUnit.enums);
    });

    test('Test enum names', () async {
      // Test enum names
      final _foundedNames = result.map((e) => e.displayName).toList()..sort();
      final _expect = ['ErrorCodeExeptions', 'Corpus']..sort();
      expect(_foundedNames, _expect,
          reason: 'Enum names should match the expected list');
    });

    test('DTO message for enum', () async {
      // Verify DTO message for enum
      enumsProtoBuilder = TmpEnumsProtoBuilder(
          result.where((element) => element.displayName == 'Corpus').toList());
      expect(enumsProtoBuilder.messages, isNotNull,
          reason: 'DTO message for enum Corpus should not be null');
      // Additional assertions ...
    });
  });
}

//
extension _ExOnList on List<ParameterElement> {
  String check(String dart) =>
      singleWhere((e) => e.type.getDisplayString(withNullability: true) == dart)
          .toProtoType;
}

class MockValueReader with ValueReader {}

///
const String inputSource = r'''
library example;

import 'package:d2p_annotation/dart_to_proto_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fr_union.freezed.dart';

  ///[1]
  class Foo {
    const Foo(this.args);
    final List<int> args;
  }

  ///[2]
  sealed class Animal {
    const Animal();
  }
  class Cow extends Animal {
    final int? weight;
    final String? nullableString;
    final DateTime? nullableDateTime;
    const Cow({
      this.weight,
      this.nullableString,
      this.nullableDateTime,
    });
  }
  class Sheep extends Animal {
    final String one;
    const Sheep({required this.one});
  }
  class Pig extends Animal {
    final double se;
    const Pig({required this.se});
  }

  ///[3]
  abstract class AbsFactories {
    const AbsFactories();
    const factory AbsFactories.empty() = AbsEmptyClass;
    const factory AbsFactories.first(String a, int b, bool c) = AbsSecond;
    const factory AbsFactories.second(String d) = AbsTherd;
    const factory AbsFactories.private() = _PrivateClass;
  }
  class AbsEmptyClass extends AbsFactories {
    const AbsEmptyClass();
  }
  class AbsSecond extends AbsFactories {
    const AbsSecond(this.a, this.b, this.c);
    final String a;
    final int b;
    final bool c;
  }
  class AbsTherd extends AbsFactories {
    const AbsTherd(this.d);
    final String d;
  }
  class _PrivateClass extends AbsFactories {
    const _PrivateClass();
  }

  /// [4]
  @freezed
  class FreezedCl with _$FreezedCl {
    const factory FreezedCl.loading() = Loading;
    const factory FreezedCl.loading3({required final double gfg}) = _Loading2;
    const factory FreezedCl.error([final String? message]) = ErrorDetails;
    const factory FreezedCl.complex(final int a, final String b) = Complex;
  }

///[5]
class Ctypes {
  final int a;
  final int? b;
  final double? c;
  final double d;
  final num e;
  final num? f;
  final bool? g;
  final bool h;
  final String i;
  final String? k;
  final DateTime? l;
  final DateTime m;
  final Map<String, String> n;
  final List<int> o;
  final Iterable p;
  final Set<String> t;
  final Map<String, String>? q;
  final List<String>? r;
  Ctypes(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.k, this.l, this.m, this.n, this.o,
      this.p, this.t, this.q, this.r);
}

  ///
  abstract class ShouldBeIgnored1 {}
  final class ShouldBeIgnored2 {
    const ShouldBeIgnored2();
  }
  base class _ShouldBeIgnored3 {
    final String mane;
    const _ShouldBeIgnored3(this.mane);
  }
  abstract interface class ShouldBeIgnored4 {}

  ///
  enum Corpus {
    CORPUS_UNSPECIFIED,
    CORPUS_UNIVERSAL,
    CORPUS_WEB,
    CORPUS_IMAGES,
    CORPUS_LOCAL,
    CORPUS_NEWS,
    CORPUS_PRODUCTS,
    CORPUS_VIDEO;
  }
  enum ErrorCodeExeptions {
    PERMISSION_NOT_FINDED,
    NETWORK_EX;
  }
''';

const Map<String, String> tC = {
  'num': 'double',
  'double': 'double',
  'int': 'int32',
  'bool': 'bool',
  'String': 'string',
  'Map': 'string',
  'enum': 'enum',
  'DateTime': 'string',
  'Set': 'repeated',
  'Iterable': 'repeated',
  'List': 'repeated',
};
