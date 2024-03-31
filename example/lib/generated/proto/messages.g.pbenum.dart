//
//  Generated code. Do not modify.
//  source: messages.g.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// *
/// Enum Gears
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOGears extends $pb.ProtobufEnum {
  static const DTOGears NAMUAL = DTOGears._(0, _omitEnumNames ? '' : 'NAMUAL');
  static const DTOGears AUTO = DTOGears._(1, _omitEnumNames ? '' : 'AUTO');

  static const $core.List<DTOGears> values = <DTOGears>[
    NAMUAL,
    AUTO,
  ];

  static final $core.Map<$core.int, DTOGears> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DTOGears? valueOf($core.int value) => _byValue[value];

  const DTOGears._($core.int v, $core.String n) : super(v, n);
}

/// *
/// Enum Colors
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOColors extends $pb.ProtobufEnum {
  static const DTOColors RED = DTOColors._(0, _omitEnumNames ? '' : 'RED');
  static const DTOColors BLUE = DTOColors._(1, _omitEnumNames ? '' : 'BLUE');
  static const DTOColors GREEN = DTOColors._(2, _omitEnumNames ? '' : 'GREEN');
  static const DTOColors WTHITE =
      DTOColors._(3, _omitEnumNames ? '' : 'WTHITE');
  static const DTOColors BLACK = DTOColors._(4, _omitEnumNames ? '' : 'BLACK');

  static const $core.List<DTOColors> values = <DTOColors>[
    RED,
    BLUE,
    GREEN,
    WTHITE,
    BLACK,
  ];

  static final $core.Map<$core.int, DTOColors> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static DTOColors? valueOf($core.int value) => _byValue[value];

  const DTOColors._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
