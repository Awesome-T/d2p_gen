//
//  Generated code. Do not modify.
//  source: proto/messages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// *
/// Enum Corpus
/// Source: 'package:/exap/lib/models/enums.dart';
class DTOCorpus extends $pb.ProtobufEnum {
  static const DTOCorpus CORPUS_UNSPECIFIED =
      DTOCorpus._(0, _omitEnumNames ? '' : 'CORPUS_UNSPECIFIED');
  static const DTOCorpus CORPUS_UNIVERSAL =
      DTOCorpus._(1, _omitEnumNames ? '' : 'CORPUS_UNIVERSAL');
  static const DTOCorpus CORPUS_WEB =
      DTOCorpus._(2, _omitEnumNames ? '' : 'CORPUS_WEB');
  static const DTOCorpus CORPUS_IMAGES =
      DTOCorpus._(3, _omitEnumNames ? '' : 'CORPUS_IMAGES');
  static const DTOCorpus CORPUS_LOCAL =
      DTOCorpus._(4, _omitEnumNames ? '' : 'CORPUS_LOCAL');
  static const DTOCorpus CORPUS_NEWS =
      DTOCorpus._(5, _omitEnumNames ? '' : 'CORPUS_NEWS');
  static const DTOCorpus CORPUS_PRODUCTS =
      DTOCorpus._(6, _omitEnumNames ? '' : 'CORPUS_PRODUCTS');
  static const DTOCorpus CORPUS_VIDEO =
      DTOCorpus._(7, _omitEnumNames ? '' : 'CORPUS_VIDEO');

  static const $core.List<DTOCorpus> values = <DTOCorpus>[
    CORPUS_UNSPECIFIED,
    CORPUS_UNIVERSAL,
    CORPUS_WEB,
    CORPUS_IMAGES,
    CORPUS_LOCAL,
    CORPUS_NEWS,
    CORPUS_PRODUCTS,
    CORPUS_VIDEO,
  ];

  static final $core.Map<$core.int, DTOCorpus> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DTOCorpus? valueOf($core.int value) => _byValue[value];

  const DTOCorpus._($core.int v, $core.String n) : super(v, n);
}

/// *
/// Enum ErrorCodeExeptions
/// Source: 'package:/exap/lib/models/enums.dart';
class DTOErrorCodeExeptions extends $pb.ProtobufEnum {
  static const DTOErrorCodeExeptions PERMISSION_NOT_FINDED =
      DTOErrorCodeExeptions._(0, _omitEnumNames ? '' : 'PERMISSION_NOT_FINDED');
  static const DTOErrorCodeExeptions NETWORK_EX =
      DTOErrorCodeExeptions._(1, _omitEnumNames ? '' : 'NETWORK_EX');

  static const $core.List<DTOErrorCodeExeptions> values =
      <DTOErrorCodeExeptions>[
    PERMISSION_NOT_FINDED,
    NETWORK_EX,
  ];

  static final $core.Map<$core.int, DTOErrorCodeExeptions> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DTOErrorCodeExeptions? valueOf($core.int value) => _byValue[value];

  const DTOErrorCodeExeptions._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
