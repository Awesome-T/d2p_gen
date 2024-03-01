//
//  Generated code. Do not modify.
//  source: messages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'messages.pbenum.dart';

export 'messages.pbenum.dart';

///
/// class: AbsFactories.first
/// Source: 'package:/exap/lib/models/abstract_factories.dart';
class DTOAbsSecond extends $pb.GeneratedMessage {
  factory DTOAbsSecond({
    $core.String? a,
    $core.int? b,
    $core.bool? c,
  }) {
    final $result = create();
    if (a != null) {
      $result.a = a;
    }
    if (b != null) {
      $result.b = b;
    }
    if (c != null) {
      $result.c = c;
    }
    return $result;
  }
  DTOAbsSecond._() : super();
  factory DTOAbsSecond.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOAbsSecond.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOAbsSecond',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'a')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'b', $pb.PbFieldType.O3)
    ..aOB(3, _omitFieldNames ? '' : 'c')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOAbsSecond clone() => DTOAbsSecond()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOAbsSecond copyWith(void Function(DTOAbsSecond) updates) =>
      super.copyWith((message) => updates(message as DTOAbsSecond))
          as DTOAbsSecond;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOAbsSecond create() => DTOAbsSecond._();
  DTOAbsSecond createEmptyInstance() => create();
  static $pb.PbList<DTOAbsSecond> createRepeated() =>
      $pb.PbList<DTOAbsSecond>();
  @$core.pragma('dart2js:noInline')
  static DTOAbsSecond getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOAbsSecond>(create);
  static DTOAbsSecond? _defaultInstance;

  /// String AbsSecond.a
  @$pb.TagNumber(1)
  $core.String get a => $_getSZ(0);
  @$pb.TagNumber(1)
  set a($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => clearField(1);

  /// int AbsSecond.b
  @$pb.TagNumber(2)
  $core.int get b => $_getIZ(1);
  @$pb.TagNumber(2)
  set b($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasB() => $_has(1);
  @$pb.TagNumber(2)
  void clearB() => clearField(2);

  /// bool AbsSecond.c
  @$pb.TagNumber(3)
  $core.bool get c => $_getBF(2);
  @$pb.TagNumber(3)
  set c($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasC() => $_has(2);
  @$pb.TagNumber(3)
  void clearC() => clearField(3);
}

///
/// class: AbsFactories.second
/// Source: 'package:/exap/lib/models/abstract_factories.dart';
class DTOAbsTherd extends $pb.GeneratedMessage {
  factory DTOAbsTherd({
    $core.String? d,
  }) {
    final $result = create();
    if (d != null) {
      $result.d = d;
    }
    return $result;
  }
  DTOAbsTherd._() : super();
  factory DTOAbsTherd.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOAbsTherd.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOAbsTherd',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'd')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOAbsTherd clone() => DTOAbsTherd()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOAbsTherd copyWith(void Function(DTOAbsTherd) updates) =>
      super.copyWith((message) => updates(message as DTOAbsTherd))
          as DTOAbsTherd;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOAbsTherd create() => DTOAbsTherd._();
  DTOAbsTherd createEmptyInstance() => create();
  static $pb.PbList<DTOAbsTherd> createRepeated() => $pb.PbList<DTOAbsTherd>();
  @$core.pragma('dart2js:noInline')
  static DTOAbsTherd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOAbsTherd>(create);
  static DTOAbsTherd? _defaultInstance;

  /// String AbsTherd.d
  @$pb.TagNumber(1)
  $core.String get d => $_getSZ(0);
  @$pb.TagNumber(1)
  set d($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasD() => $_has(0);
  @$pb.TagNumber(1)
  void clearD() => clearField(1);
}

enum DTOAbsFactories_Union_Absfactories { first, second, notSet }

///
///  class: absfactories
class DTOAbsFactories_Union extends $pb.GeneratedMessage {
  factory DTOAbsFactories_Union({
    DTOAbsSecond? first,
    DTOAbsTherd? second,
  }) {
    final $result = create();
    if (first != null) {
      $result.first = first;
    }
    if (second != null) {
      $result.second = second;
    }
    return $result;
  }
  DTOAbsFactories_Union._() : super();
  factory DTOAbsFactories_Union.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOAbsFactories_Union.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DTOAbsFactories_Union_Absfactories>
      _DTOAbsFactories_Union_AbsfactoriesByTag = {
    1: DTOAbsFactories_Union_Absfactories.first,
    2: DTOAbsFactories_Union_Absfactories.second,
    0: DTOAbsFactories_Union_Absfactories.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOAbsFactories_Union',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<DTOAbsSecond>(1, _omitFieldNames ? '' : 'first',
        subBuilder: DTOAbsSecond.create)
    ..aOM<DTOAbsTherd>(2, _omitFieldNames ? '' : 'second',
        subBuilder: DTOAbsTherd.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOAbsFactories_Union clone() =>
      DTOAbsFactories_Union()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOAbsFactories_Union copyWith(
          void Function(DTOAbsFactories_Union) updates) =>
      super.copyWith((message) => updates(message as DTOAbsFactories_Union))
          as DTOAbsFactories_Union;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOAbsFactories_Union create() => DTOAbsFactories_Union._();
  DTOAbsFactories_Union createEmptyInstance() => create();
  static $pb.PbList<DTOAbsFactories_Union> createRepeated() =>
      $pb.PbList<DTOAbsFactories_Union>();
  @$core.pragma('dart2js:noInline')
  static DTOAbsFactories_Union getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOAbsFactories_Union>(create);
  static DTOAbsFactories_Union? _defaultInstance;

  DTOAbsFactories_Union_Absfactories whichAbsfactories() =>
      _DTOAbsFactories_Union_AbsfactoriesByTag[$_whichOneof(0)]!;
  void clearAbsfactories() => clearField($_whichOneof(0));

  /// class AbsSecond
  @$pb.TagNumber(1)
  DTOAbsSecond get first => $_getN(0);
  @$pb.TagNumber(1)
  set first(DTOAbsSecond v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFirst() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirst() => clearField(1);
  @$pb.TagNumber(1)
  DTOAbsSecond ensureFirst() => $_ensure(0);

  /// class AbsTherd
  @$pb.TagNumber(2)
  DTOAbsTherd get second => $_getN(1);
  @$pb.TagNumber(2)
  set second(DTOAbsTherd v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSecond() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecond() => clearField(2);
  @$pb.TagNumber(2)
  DTOAbsTherd ensureSecond() => $_ensure(1);
}

///
/// class: FirstLevel
/// Source: 'package:/exap/lib/models/nested_classes.dart';
class DTOFirstLevel extends $pb.GeneratedMessage {
  factory DTOFirstLevel({
    $core.String? dt,
    $core.double? ninew,
    $core.double? pwqwq,
    $core.Iterable<DTOSecondLevel>? nesyed,
    $core.Iterable<DTOEnumForArr>? arrOfEnums,
    $core.String? mapa,
    $core.int? one,
    $core.String? three,
    $core.bool? seven,
    $core.Iterable<$core.String>? nine,
    $core.String? ten,
    $core.int? zerro,
    $core.Iterable<$core.double>? float,
    $core.String? two,
    $core.bool? eight,
  }) {
    final $result = create();
    if (dt != null) {
      $result.dt = dt;
    }
    if (ninew != null) {
      $result.ninew = ninew;
    }
    if (pwqwq != null) {
      $result.pwqwq = pwqwq;
    }
    if (nesyed != null) {
      $result.nesyed.addAll(nesyed);
    }
    if (arrOfEnums != null) {
      $result.arrOfEnums.addAll(arrOfEnums);
    }
    if (mapa != null) {
      $result.mapa = mapa;
    }
    if (one != null) {
      $result.one = one;
    }
    if (three != null) {
      $result.three = three;
    }
    if (seven != null) {
      $result.seven = seven;
    }
    if (nine != null) {
      $result.nine.addAll(nine);
    }
    if (ten != null) {
      $result.ten = ten;
    }
    if (zerro != null) {
      $result.zerro = zerro;
    }
    if (float != null) {
      $result.float.addAll(float);
    }
    if (two != null) {
      $result.two = two;
    }
    if (eight != null) {
      $result.eight = eight;
    }
    return $result;
  }
  DTOFirstLevel._() : super();
  factory DTOFirstLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOFirstLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOFirstLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dt')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'ninew', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'pwqwq', $pb.PbFieldType.OD)
    ..pc<DTOSecondLevel>(4, _omitFieldNames ? '' : 'nesyed', $pb.PbFieldType.PM,
        subBuilder: DTOSecondLevel.create)
    ..pc<DTOEnumForArr>(
        5, _omitFieldNames ? '' : 'arrOfEnums', $pb.PbFieldType.KE,
        protoName: 'arrOfEnums',
        valueOf: DTOEnumForArr.valueOf,
        enumValues: DTOEnumForArr.values,
        defaultEnumValue: DTOEnumForArr.ONE)
    ..aOS(6, _omitFieldNames ? '' : 'mapa')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'one', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'three')
    ..aOB(9, _omitFieldNames ? '' : 'seven')
    ..pPS(10, _omitFieldNames ? '' : 'nine')
    ..aOS(11, _omitFieldNames ? '' : 'ten')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'zerro', $pb.PbFieldType.O3)
    ..p<$core.double>(13, _omitFieldNames ? '' : 'float', $pb.PbFieldType.KD)
    ..aOS(14, _omitFieldNames ? '' : 'two')
    ..aOB(15, _omitFieldNames ? '' : 'eight')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOFirstLevel clone() => DTOFirstLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOFirstLevel copyWith(void Function(DTOFirstLevel) updates) =>
      super.copyWith((message) => updates(message as DTOFirstLevel))
          as DTOFirstLevel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOFirstLevel create() => DTOFirstLevel._();
  DTOFirstLevel createEmptyInstance() => create();
  static $pb.PbList<DTOFirstLevel> createRepeated() =>
      $pb.PbList<DTOFirstLevel>();
  @$core.pragma('dart2js:noInline')
  static DTOFirstLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOFirstLevel>(create);
  static DTOFirstLevel? _defaultInstance;

  /// DateTime? FirstLevel.dt
  @$pb.TagNumber(1)
  $core.String get dt => $_getSZ(0);
  @$pb.TagNumber(1)
  set dt($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDt() => $_has(0);
  @$pb.TagNumber(1)
  void clearDt() => clearField(1);

  /// double FirstLevel.ninew
  @$pb.TagNumber(2)
  $core.double get ninew => $_getN(1);
  @$pb.TagNumber(2)
  set ninew($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNinew() => $_has(1);
  @$pb.TagNumber(2)
  void clearNinew() => clearField(2);

  /// double? FirstLevel.pwqwq
  @$pb.TagNumber(3)
  $core.double get pwqwq => $_getN(2);
  @$pb.TagNumber(3)
  set pwqwq($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPwqwq() => $_has(2);
  @$pb.TagNumber(3)
  void clearPwqwq() => clearField(3);

  /// List<SecondLevel> FirstLevel.nesyed
  @$pb.TagNumber(4)
  $core.List<DTOSecondLevel> get nesyed => $_getList(3);

  /// List<EnumForArr> FirstLevel.arrOfEnums
  @$pb.TagNumber(5)
  $core.List<DTOEnumForArr> get arrOfEnums => $_getList(4);

  /// Map<String, dynamic> FirstLevel.mapa
  @$pb.TagNumber(6)
  $core.String get mapa => $_getSZ(5);
  @$pb.TagNumber(6)
  set mapa($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMapa() => $_has(5);
  @$pb.TagNumber(6)
  void clearMapa() => clearField(6);

  /// int FirstLevel.one
  @$pb.TagNumber(7)
  $core.int get one => $_getIZ(6);
  @$pb.TagNumber(7)
  set one($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOne() => $_has(6);
  @$pb.TagNumber(7)
  void clearOne() => clearField(7);

  /// String FirstLevel.three
  @$pb.TagNumber(8)
  $core.String get three => $_getSZ(7);
  @$pb.TagNumber(8)
  set three($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasThree() => $_has(7);
  @$pb.TagNumber(8)
  void clearThree() => clearField(8);

  /// bool FirstLevel.seven
  @$pb.TagNumber(9)
  $core.bool get seven => $_getBF(8);
  @$pb.TagNumber(9)
  set seven($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSeven() => $_has(8);
  @$pb.TagNumber(9)
  void clearSeven() => clearField(9);

  /// List<DateTime> FirstLevel.nine
  @$pb.TagNumber(10)
  $core.List<$core.String> get nine => $_getList(9);

  /// DateTime FirstLevel.ten
  @$pb.TagNumber(11)
  $core.String get ten => $_getSZ(10);
  @$pb.TagNumber(11)
  set ten($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasTen() => $_has(10);
  @$pb.TagNumber(11)
  void clearTen() => clearField(11);

  /// int? FirstLevel.zerro
  @$pb.TagNumber(12)
  $core.int get zerro => $_getIZ(11);
  @$pb.TagNumber(12)
  set zerro($core.int v) {
    $_setSignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasZerro() => $_has(11);
  @$pb.TagNumber(12)
  void clearZerro() => clearField(12);

  /// List<double>? FirstLevel.float
  @$pb.TagNumber(13)
  $core.List<$core.double> get float => $_getList(12);

  /// String? FirstLevel.two
  @$pb.TagNumber(14)
  $core.String get two => $_getSZ(13);
  @$pb.TagNumber(14)
  set two($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTwo() => $_has(13);
  @$pb.TagNumber(14)
  void clearTwo() => clearField(14);

  /// bool? FirstLevel.eight
  @$pb.TagNumber(15)
  $core.bool get eight => $_getBF(14);
  @$pb.TagNumber(15)
  set eight($core.bool v) {
    $_setBool(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasEight() => $_has(14);
  @$pb.TagNumber(15)
  void clearEight() => clearField(15);
}

///
/// class: SecondLevel
/// Source: 'package:/exap/lib/models/nested_classes.dart';
class DTOSecondLevel extends $pb.GeneratedMessage {
  factory DTOSecondLevel({
    $core.int? count,
    $core.Iterable<DTOTherdLevel>? arr,
  }) {
    final $result = create();
    if (count != null) {
      $result.count = count;
    }
    if (arr != null) {
      $result.arr.addAll(arr);
    }
    return $result;
  }
  DTOSecondLevel._() : super();
  factory DTOSecondLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOSecondLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOSecondLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..pc<DTOTherdLevel>(2, _omitFieldNames ? '' : 'arr', $pb.PbFieldType.PM,
        subBuilder: DTOTherdLevel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOSecondLevel clone() => DTOSecondLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOSecondLevel copyWith(void Function(DTOSecondLevel) updates) =>
      super.copyWith((message) => updates(message as DTOSecondLevel))
          as DTOSecondLevel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOSecondLevel create() => DTOSecondLevel._();
  DTOSecondLevel createEmptyInstance() => create();
  static $pb.PbList<DTOSecondLevel> createRepeated() =>
      $pb.PbList<DTOSecondLevel>();
  @$core.pragma('dart2js:noInline')
  static DTOSecondLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOSecondLevel>(create);
  static DTOSecondLevel? _defaultInstance;

  /// int SecondLevel.count
  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);

  /// List<TherdLevel> SecondLevel.arr
  @$pb.TagNumber(2)
  $core.List<DTOTherdLevel> get arr => $_getList(1);
}

///
/// class: TherdLevel
/// Source: 'package:/exap/lib/models/nested_classes.dart';
class DTOTherdLevel extends $pb.GeneratedMessage {
  factory DTOTherdLevel({
    $core.Iterable<$core.int>? count,
  }) {
    final $result = create();
    if (count != null) {
      $result.count.addAll(count);
    }
    return $result;
  }
  DTOTherdLevel._() : super();
  factory DTOTherdLevel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOTherdLevel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOTherdLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'count', $pb.PbFieldType.K3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOTherdLevel clone() => DTOTherdLevel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOTherdLevel copyWith(void Function(DTOTherdLevel) updates) =>
      super.copyWith((message) => updates(message as DTOTherdLevel))
          as DTOTherdLevel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOTherdLevel create() => DTOTherdLevel._();
  DTOTherdLevel createEmptyInstance() => create();
  static $pb.PbList<DTOTherdLevel> createRepeated() =>
      $pb.PbList<DTOTherdLevel>();
  @$core.pragma('dart2js:noInline')
  static DTOTherdLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOTherdLevel>(create);
  static DTOTherdLevel? _defaultInstance;

  /// List<int> TherdLevel.count
  @$pb.TagNumber(1)
  $core.List<$core.int> get count => $_getList(0);
}

///
/// class: Pioijh
/// Source: 'package:/exap/lib/models/model.dart';
class DTOPioijh extends $pb.GeneratedMessage {
  factory DTOPioijh({
    $core.Iterable<DTOBlah>? smthn,
    $core.int? age,
  }) {
    final $result = create();
    if (smthn != null) {
      $result.smthn.addAll(smthn);
    }
    if (age != null) {
      $result.age = age;
    }
    return $result;
  }
  DTOPioijh._() : super();
  factory DTOPioijh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOPioijh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOPioijh',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pc<DTOBlah>(1, _omitFieldNames ? '' : 'smthn', $pb.PbFieldType.PM,
        subBuilder: DTOBlah.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOPioijh clone() => DTOPioijh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOPioijh copyWith(void Function(DTOPioijh) updates) =>
      super.copyWith((message) => updates(message as DTOPioijh)) as DTOPioijh;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOPioijh create() => DTOPioijh._();
  DTOPioijh createEmptyInstance() => create();
  static $pb.PbList<DTOPioijh> createRepeated() => $pb.PbList<DTOPioijh>();
  @$core.pragma('dart2js:noInline')
  static DTOPioijh getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOPioijh>(create);
  static DTOPioijh? _defaultInstance;

  /// List<Blah>? Pioijh.smthn
  @$pb.TagNumber(1)
  $core.List<DTOBlah> get smthn => $_getList(0);

  /// int Pioijh.age
  @$pb.TagNumber(2)
  $core.int get age => $_getIZ(1);
  @$pb.TagNumber(2)
  set age($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAge() => $_has(1);
  @$pb.TagNumber(2)
  void clearAge() => clearField(2);
}

///
/// class: Person
/// Source: 'package:/exap/lib/models/model.dart';
class DTOPerson extends $pb.GeneratedMessage {
  factory DTOPerson({
    $core.String? createdAt,
    $core.Iterable<DTOBlah>? blahs,
  }) {
    final $result = create();
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (blahs != null) {
      $result.blahs.addAll(blahs);
    }
    return $result;
  }
  DTOPerson._() : super();
  factory DTOPerson.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOPerson.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOPerson',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'createdAt', protoName: 'createdAt')
    ..pc<DTOBlah>(2, _omitFieldNames ? '' : 'blahs', $pb.PbFieldType.PM,
        subBuilder: DTOBlah.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOPerson clone() => DTOPerson()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOPerson copyWith(void Function(DTOPerson) updates) =>
      super.copyWith((message) => updates(message as DTOPerson)) as DTOPerson;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOPerson create() => DTOPerson._();
  DTOPerson createEmptyInstance() => create();
  static $pb.PbList<DTOPerson> createRepeated() => $pb.PbList<DTOPerson>();
  @$core.pragma('dart2js:noInline')
  static DTOPerson getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOPerson>(create);
  static DTOPerson? _defaultInstance;

  /// DateTime Person.createdAt
  @$pb.TagNumber(1)
  $core.String get createdAt => $_getSZ(0);
  @$pb.TagNumber(1)
  set createdAt($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCreatedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreatedAt() => clearField(1);

  /// List<Blah>? Person.blahs
  @$pb.TagNumber(2)
  $core.List<DTOBlah> get blahs => $_getList(1);
}

///
/// class: Blah
/// Source: 'package:/exap/lib/models/model.dart';
class DTOBlah extends $pb.GeneratedMessage {
  factory DTOBlah({
    $core.String? id,
    $core.Iterable<$core.String>? tags,
    $core.double? price,
    $core.bool? isVerifyed,
    $core.String? settings,
    $core.int? count,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (price != null) {
      $result.price = price;
    }
    if (isVerifyed != null) {
      $result.isVerifyed = isVerifyed;
    }
    if (settings != null) {
      $result.settings = settings;
    }
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  DTOBlah._() : super();
  factory DTOBlah.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOBlah.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOBlah',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..pPS(2, _omitFieldNames ? '' : 'tags')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'price', $pb.PbFieldType.OD)
    ..aOB(4, _omitFieldNames ? '' : 'isVerifyed', protoName: 'isVerifyed')
    ..aOS(5, _omitFieldNames ? '' : 'settings')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOBlah clone() => DTOBlah()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOBlah copyWith(void Function(DTOBlah) updates) =>
      super.copyWith((message) => updates(message as DTOBlah)) as DTOBlah;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOBlah create() => DTOBlah._();
  DTOBlah createEmptyInstance() => create();
  static $pb.PbList<DTOBlah> createRepeated() => $pb.PbList<DTOBlah>();
  @$core.pragma('dart2js:noInline')
  static DTOBlah getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOBlah>(create);
  static DTOBlah? _defaultInstance;

  /// String Blah.id
  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  /// List<String> Blah.tags
  @$pb.TagNumber(2)
  $core.List<$core.String> get tags => $_getList(1);

  /// double Blah.price
  @$pb.TagNumber(3)
  $core.double get price => $_getN(2);
  @$pb.TagNumber(3)
  set price($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  /// bool Blah.isVerifyed
  @$pb.TagNumber(4)
  $core.bool get isVerifyed => $_getBF(3);
  @$pb.TagNumber(4)
  set isVerifyed($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsVerifyed() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsVerifyed() => clearField(4);

  /// Map<String, double> Blah.settings
  @$pb.TagNumber(5)
  $core.String get settings => $_getSZ(4);
  @$pb.TagNumber(5)
  set settings($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSettings() => $_has(4);
  @$pb.TagNumber(5)
  void clearSettings() => clearField(5);

  /// int? Blah.count
  @$pb.TagNumber(6)
  $core.int get count => $_getIZ(5);
  @$pb.TagNumber(6)
  set count($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearCount() => clearField(6);
}

///
/// class: FreezedCl.error
/// Source: 'package:/exap/lib/models/fr_union.dart';
class DTOErrorDetails extends $pb.GeneratedMessage {
  factory DTOErrorDetails({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  DTOErrorDetails._() : super();
  factory DTOErrorDetails.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOErrorDetails.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOErrorDetails',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOErrorDetails clone() => DTOErrorDetails()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOErrorDetails copyWith(void Function(DTOErrorDetails) updates) =>
      super.copyWith((message) => updates(message as DTOErrorDetails))
          as DTOErrorDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOErrorDetails create() => DTOErrorDetails._();
  DTOErrorDetails createEmptyInstance() => create();
  static $pb.PbList<DTOErrorDetails> createRepeated() =>
      $pb.PbList<DTOErrorDetails>();
  @$core.pragma('dart2js:noInline')
  static DTOErrorDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOErrorDetails>(create);
  static DTOErrorDetails? _defaultInstance;

  /// String? ErrorDetails.message
  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

///
/// class: FreezedCl.complex
/// Source: 'package:/exap/lib/models/fr_union.dart';
class DTOComplex extends $pb.GeneratedMessage {
  factory DTOComplex({
    $core.int? a,
    $core.String? b,
  }) {
    final $result = create();
    if (a != null) {
      $result.a = a;
    }
    if (b != null) {
      $result.b = b;
    }
    return $result;
  }
  DTOComplex._() : super();
  factory DTOComplex.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOComplex.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOComplex',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'a', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'b')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOComplex clone() => DTOComplex()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOComplex copyWith(void Function(DTOComplex) updates) =>
      super.copyWith((message) => updates(message as DTOComplex)) as DTOComplex;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOComplex create() => DTOComplex._();
  DTOComplex createEmptyInstance() => create();
  static $pb.PbList<DTOComplex> createRepeated() => $pb.PbList<DTOComplex>();
  @$core.pragma('dart2js:noInline')
  static DTOComplex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOComplex>(create);
  static DTOComplex? _defaultInstance;

  /// int Complex.a
  @$pb.TagNumber(1)
  $core.int get a => $_getIZ(0);
  @$pb.TagNumber(1)
  set a($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => clearField(1);

  /// String Complex.b
  @$pb.TagNumber(2)
  $core.String get b => $_getSZ(1);
  @$pb.TagNumber(2)
  set b($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasB() => $_has(1);
  @$pb.TagNumber(2)
  void clearB() => clearField(2);
}

enum DTOFreezedCl_Union_Freezedcl { error, complex, notSet }

///
///  class: freezedcl
class DTOFreezedCl_Union extends $pb.GeneratedMessage {
  factory DTOFreezedCl_Union({
    DTOErrorDetails? error,
    DTOComplex? complex,
  }) {
    final $result = create();
    if (error != null) {
      $result.error = error;
    }
    if (complex != null) {
      $result.complex = complex;
    }
    return $result;
  }
  DTOFreezedCl_Union._() : super();
  factory DTOFreezedCl_Union.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOFreezedCl_Union.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DTOFreezedCl_Union_Freezedcl>
      _DTOFreezedCl_Union_FreezedclByTag = {
    1: DTOFreezedCl_Union_Freezedcl.error,
    2: DTOFreezedCl_Union_Freezedcl.complex,
    0: DTOFreezedCl_Union_Freezedcl.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOFreezedCl_Union',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<DTOErrorDetails>(1, _omitFieldNames ? '' : 'error',
        subBuilder: DTOErrorDetails.create)
    ..aOM<DTOComplex>(2, _omitFieldNames ? '' : 'complex',
        subBuilder: DTOComplex.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOFreezedCl_Union clone() => DTOFreezedCl_Union()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOFreezedCl_Union copyWith(void Function(DTOFreezedCl_Union) updates) =>
      super.copyWith((message) => updates(message as DTOFreezedCl_Union))
          as DTOFreezedCl_Union;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOFreezedCl_Union create() => DTOFreezedCl_Union._();
  DTOFreezedCl_Union createEmptyInstance() => create();
  static $pb.PbList<DTOFreezedCl_Union> createRepeated() =>
      $pb.PbList<DTOFreezedCl_Union>();
  @$core.pragma('dart2js:noInline')
  static DTOFreezedCl_Union getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOFreezedCl_Union>(create);
  static DTOFreezedCl_Union? _defaultInstance;

  DTOFreezedCl_Union_Freezedcl whichFreezedcl() =>
      _DTOFreezedCl_Union_FreezedclByTag[$_whichOneof(0)]!;
  void clearFreezedcl() => clearField($_whichOneof(0));

  /// class ErrorDetails
  @$pb.TagNumber(1)
  DTOErrorDetails get error => $_getN(0);
  @$pb.TagNumber(1)
  set error(DTOErrorDetails v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);
  @$pb.TagNumber(1)
  DTOErrorDetails ensureError() => $_ensure(0);

  /// class Complex
  @$pb.TagNumber(2)
  DTOComplex get complex => $_getN(1);
  @$pb.TagNumber(2)
  set complex(DTOComplex v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasComplex() => $_has(1);
  @$pb.TagNumber(2)
  void clearComplex() => clearField(2);
  @$pb.TagNumber(2)
  DTOComplex ensureComplex() => $_ensure(1);
}

///
/// class: Cow
/// Source: 'package:/exap/lib/models/sealeds.dart';
class DTOCow extends $pb.GeneratedMessage {
  factory DTOCow({
    $core.int? weight,
    $core.String? nullableString,
    $core.String? nullableDateTime,
  }) {
    final $result = create();
    if (weight != null) {
      $result.weight = weight;
    }
    if (nullableString != null) {
      $result.nullableString = nullableString;
    }
    if (nullableDateTime != null) {
      $result.nullableDateTime = nullableDateTime;
    }
    return $result;
  }
  DTOCow._() : super();
  factory DTOCow.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOCow.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOCow',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'weight', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'nullableString',
        protoName: 'nullableString')
    ..aOS(3, _omitFieldNames ? '' : 'nullableDateTime',
        protoName: 'nullableDateTime')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOCow clone() => DTOCow()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOCow copyWith(void Function(DTOCow) updates) =>
      super.copyWith((message) => updates(message as DTOCow)) as DTOCow;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOCow create() => DTOCow._();
  DTOCow createEmptyInstance() => create();
  static $pb.PbList<DTOCow> createRepeated() => $pb.PbList<DTOCow>();
  @$core.pragma('dart2js:noInline')
  static DTOCow getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOCow>(create);
  static DTOCow? _defaultInstance;

  /// int? Cow.weight
  @$pb.TagNumber(1)
  $core.int get weight => $_getIZ(0);
  @$pb.TagNumber(1)
  set weight($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearWeight() => clearField(1);

  /// String? Cow.nullableString
  @$pb.TagNumber(2)
  $core.String get nullableString => $_getSZ(1);
  @$pb.TagNumber(2)
  set nullableString($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNullableString() => $_has(1);
  @$pb.TagNumber(2)
  void clearNullableString() => clearField(2);

  /// DateTime? Cow.nullableDateTime
  @$pb.TagNumber(3)
  $core.String get nullableDateTime => $_getSZ(2);
  @$pb.TagNumber(3)
  set nullableDateTime($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNullableDateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearNullableDateTime() => clearField(3);
}

///
/// class: Sheep
/// Source: 'package:/exap/lib/models/sealeds.dart';
class DTOSheep extends $pb.GeneratedMessage {
  factory DTOSheep({
    $core.String? one,
  }) {
    final $result = create();
    if (one != null) {
      $result.one = one;
    }
    return $result;
  }
  DTOSheep._() : super();
  factory DTOSheep.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOSheep.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOSheep',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'one')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOSheep clone() => DTOSheep()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOSheep copyWith(void Function(DTOSheep) updates) =>
      super.copyWith((message) => updates(message as DTOSheep)) as DTOSheep;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOSheep create() => DTOSheep._();
  DTOSheep createEmptyInstance() => create();
  static $pb.PbList<DTOSheep> createRepeated() => $pb.PbList<DTOSheep>();
  @$core.pragma('dart2js:noInline')
  static DTOSheep getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOSheep>(create);
  static DTOSheep? _defaultInstance;

  /// String Sheep.one
  @$pb.TagNumber(1)
  $core.String get one => $_getSZ(0);
  @$pb.TagNumber(1)
  set one($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOne() => $_has(0);
  @$pb.TagNumber(1)
  void clearOne() => clearField(1);
}

///
/// class: Pig
/// Source: 'package:/exap/lib/models/sealeds.dart';
class DTOPig extends $pb.GeneratedMessage {
  factory DTOPig({
    $core.double? se,
  }) {
    final $result = create();
    if (se != null) {
      $result.se = se;
    }
    return $result;
  }
  DTOPig._() : super();
  factory DTOPig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOPig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOPig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'se', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOPig clone() => DTOPig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOPig copyWith(void Function(DTOPig) updates) =>
      super.copyWith((message) => updates(message as DTOPig)) as DTOPig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOPig create() => DTOPig._();
  DTOPig createEmptyInstance() => create();
  static $pb.PbList<DTOPig> createRepeated() => $pb.PbList<DTOPig>();
  @$core.pragma('dart2js:noInline')
  static DTOPig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOPig>(create);
  static DTOPig? _defaultInstance;

  /// double Pig.se
  @$pb.TagNumber(1)
  $core.double get se => $_getN(0);
  @$pb.TagNumber(1)
  set se($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSe() => $_has(0);
  @$pb.TagNumber(1)
  void clearSe() => clearField(1);
}

enum DTOAnimal_Union_Animal { cow, sheep, pig, notSet }

///
///  class: animal
class DTOAnimal_Union extends $pb.GeneratedMessage {
  factory DTOAnimal_Union({
    DTOCow? cow,
    DTOSheep? sheep,
    DTOPig? pig,
  }) {
    final $result = create();
    if (cow != null) {
      $result.cow = cow;
    }
    if (sheep != null) {
      $result.sheep = sheep;
    }
    if (pig != null) {
      $result.pig = pig;
    }
    return $result;
  }
  DTOAnimal_Union._() : super();
  factory DTOAnimal_Union.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOAnimal_Union.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DTOAnimal_Union_Animal>
      _DTOAnimal_Union_AnimalByTag = {
    1: DTOAnimal_Union_Animal.cow,
    2: DTOAnimal_Union_Animal.sheep,
    3: DTOAnimal_Union_Animal.pig,
    0: DTOAnimal_Union_Animal.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOAnimal_Union',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<DTOCow>(1, _omitFieldNames ? '' : 'cow', subBuilder: DTOCow.create)
    ..aOM<DTOSheep>(2, _omitFieldNames ? '' : 'sheep',
        subBuilder: DTOSheep.create)
    ..aOM<DTOPig>(3, _omitFieldNames ? '' : 'pig', subBuilder: DTOPig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOAnimal_Union clone() => DTOAnimal_Union()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOAnimal_Union copyWith(void Function(DTOAnimal_Union) updates) =>
      super.copyWith((message) => updates(message as DTOAnimal_Union))
          as DTOAnimal_Union;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOAnimal_Union create() => DTOAnimal_Union._();
  DTOAnimal_Union createEmptyInstance() => create();
  static $pb.PbList<DTOAnimal_Union> createRepeated() =>
      $pb.PbList<DTOAnimal_Union>();
  @$core.pragma('dart2js:noInline')
  static DTOAnimal_Union getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOAnimal_Union>(create);
  static DTOAnimal_Union? _defaultInstance;

  DTOAnimal_Union_Animal whichAnimal() =>
      _DTOAnimal_Union_AnimalByTag[$_whichOneof(0)]!;
  void clearAnimal() => clearField($_whichOneof(0));

  /// class Cow
  @$pb.TagNumber(1)
  DTOCow get cow => $_getN(0);
  @$pb.TagNumber(1)
  set cow(DTOCow v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCow() => $_has(0);
  @$pb.TagNumber(1)
  void clearCow() => clearField(1);
  @$pb.TagNumber(1)
  DTOCow ensureCow() => $_ensure(0);

  /// class Sheep
  @$pb.TagNumber(2)
  DTOSheep get sheep => $_getN(1);
  @$pb.TagNumber(2)
  set sheep(DTOSheep v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSheep() => $_has(1);
  @$pb.TagNumber(2)
  void clearSheep() => clearField(2);
  @$pb.TagNumber(2)
  DTOSheep ensureSheep() => $_ensure(1);

  /// class Pig
  @$pb.TagNumber(3)
  DTOPig get pig => $_getN(2);
  @$pb.TagNumber(3)
  set pig(DTOPig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPig() => $_has(2);
  @$pb.TagNumber(3)
  void clearPig() => clearField(3);
  @$pb.TagNumber(3)
  DTOPig ensurePig() => $_ensure(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
