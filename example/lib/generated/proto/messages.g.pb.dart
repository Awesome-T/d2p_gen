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

import 'messages.g.pbenum.dart';

export 'messages.g.pbenum.dart';

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
/// class: CarModel
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOCarModel extends $pb.GeneratedMessage {
  factory DTOCarModel({
    $core.String? produsedAt,
    $core.String? dateOfSale,
    $core.String? modelName,
    DTOAutomakers? produser,
    $core.Iterable<DTOBodyStyle_Union>? bodyStyles,
    $core.String? variants,
    DTOColors? avalebleColors,
    $core.Iterable<DTOEngine_Union>? engines,
    DTOGears? gear,
  }) {
    final $result = create();
    if (produsedAt != null) {
      $result.produsedAt = produsedAt;
    }
    if (dateOfSale != null) {
      $result.dateOfSale = dateOfSale;
    }
    if (modelName != null) {
      $result.modelName = modelName;
    }
    if (produser != null) {
      $result.produser = produser;
    }
    if (bodyStyles != null) {
      $result.bodyStyles.addAll(bodyStyles);
    }
    if (variants != null) {
      $result.variants = variants;
    }
    if (avalebleColors != null) {
      $result.avalebleColors = avalebleColors;
    }
    if (engines != null) {
      $result.engines.addAll(engines);
    }
    if (gear != null) {
      $result.gear = gear;
    }
    return $result;
  }
  DTOCarModel._() : super();
  factory DTOCarModel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOCarModel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOCarModel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'produsedAt', protoName: 'produsedAt')
    ..aOS(2, _omitFieldNames ? '' : 'dateOfSale', protoName: 'dateOfSale')
    ..aOS(3, _omitFieldNames ? '' : 'modelName', protoName: 'modelName')
    ..aOM<DTOAutomakers>(4, _omitFieldNames ? '' : 'produser',
        subBuilder: DTOAutomakers.create)
    ..pc<DTOBodyStyle_Union>(
        5, _omitFieldNames ? '' : 'bodyStyles', $pb.PbFieldType.PM,
        protoName: 'bodyStyles', subBuilder: DTOBodyStyle_Union.create)
    ..aOS(6, _omitFieldNames ? '' : 'variants')
    ..e<DTOColors>(
        7, _omitFieldNames ? '' : 'avalebleColors', $pb.PbFieldType.OE,
        protoName: 'avalebleColors',
        defaultOrMaker: DTOColors.RED,
        valueOf: DTOColors.valueOf,
        enumValues: DTOColors.values)
    ..pc<DTOEngine_Union>(
        8, _omitFieldNames ? '' : 'engines', $pb.PbFieldType.PM,
        subBuilder: DTOEngine_Union.create)
    ..e<DTOGears>(9, _omitFieldNames ? '' : 'gear', $pb.PbFieldType.OE,
        defaultOrMaker: DTOGears.NAMUAL,
        valueOf: DTOGears.valueOf,
        enumValues: DTOGears.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOCarModel clone() => DTOCarModel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOCarModel copyWith(void Function(DTOCarModel) updates) =>
      super.copyWith((message) => updates(message as DTOCarModel))
          as DTOCarModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOCarModel create() => DTOCarModel._();
  DTOCarModel createEmptyInstance() => create();
  static $pb.PbList<DTOCarModel> createRepeated() => $pb.PbList<DTOCarModel>();
  @$core.pragma('dart2js:noInline')
  static DTOCarModel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOCarModel>(create);
  static DTOCarModel? _defaultInstance;

  /// DateTime CarModel.produsedAt
  @$pb.TagNumber(1)
  $core.String get produsedAt => $_getSZ(0);
  @$pb.TagNumber(1)
  set produsedAt($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProdusedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearProdusedAt() => clearField(1);

  /// DateTime? CarModel.dateOfSale
  @$pb.TagNumber(2)
  $core.String get dateOfSale => $_getSZ(1);
  @$pb.TagNumber(2)
  set dateOfSale($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDateOfSale() => $_has(1);
  @$pb.TagNumber(2)
  void clearDateOfSale() => clearField(2);

  /// String CarModel.modelName
  @$pb.TagNumber(3)
  $core.String get modelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set modelName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasModelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearModelName() => clearField(3);

  /// Automakers CarModel.produser
  @$pb.TagNumber(4)
  DTOAutomakers get produser => $_getN(3);
  @$pb.TagNumber(4)
  set produser(DTOAutomakers v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProduser() => $_has(3);
  @$pb.TagNumber(4)
  void clearProduser() => clearField(4);
  @$pb.TagNumber(4)
  DTOAutomakers ensureProduser() => $_ensure(3);

  /// List<BodyStyle> CarModel.bodyStyles
  @$pb.TagNumber(5)
  $core.List<DTOBodyStyle_Union> get bodyStyles => $_getList(4);

  /// Map<String, int> CarModel.variants
  @$pb.TagNumber(6)
  $core.String get variants => $_getSZ(5);
  @$pb.TagNumber(6)
  set variants($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVariants() => $_has(5);
  @$pb.TagNumber(6)
  void clearVariants() => clearField(6);

  /// Colors CarModel.avalebleColors
  @$pb.TagNumber(7)
  DTOColors get avalebleColors => $_getN(6);
  @$pb.TagNumber(7)
  set avalebleColors(DTOColors v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAvalebleColors() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvalebleColors() => clearField(7);

  /// List<Engine> CarModel.engines
  @$pb.TagNumber(8)
  $core.List<DTOEngine_Union> get engines => $_getList(7);

  /// Gears CarModel.gear
  @$pb.TagNumber(9)
  DTOGears get gear => $_getN(8);
  @$pb.TagNumber(9)
  set gear(DTOGears v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGear() => $_has(8);
  @$pb.TagNumber(9)
  void clearGear() => clearField(9);
}

///
/// class: Automakers
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOAutomakers extends $pb.GeneratedMessage {
  factory DTOAutomakers({
    $core.Iterable<$core.String>? brands,
    $core.String? name,
    $core.String? country,
  }) {
    final $result = create();
    if (brands != null) {
      $result.brands.addAll(brands);
    }
    if (name != null) {
      $result.name = name;
    }
    if (country != null) {
      $result.country = country;
    }
    return $result;
  }
  DTOAutomakers._() : super();
  factory DTOAutomakers.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOAutomakers.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOAutomakers',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'brands')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'country')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOAutomakers clone() => DTOAutomakers()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOAutomakers copyWith(void Function(DTOAutomakers) updates) =>
      super.copyWith((message) => updates(message as DTOAutomakers))
          as DTOAutomakers;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOAutomakers create() => DTOAutomakers._();
  DTOAutomakers createEmptyInstance() => create();
  static $pb.PbList<DTOAutomakers> createRepeated() =>
      $pb.PbList<DTOAutomakers>();
  @$core.pragma('dart2js:noInline')
  static DTOAutomakers getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOAutomakers>(create);
  static DTOAutomakers? _defaultInstance;

  /// List<String> Automakers.brands
  @$pb.TagNumber(1)
  $core.List<$core.String> get brands => $_getList(0);

  /// String Automakers.name
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  /// String Automakers.country
  @$pb.TagNumber(3)
  $core.String get country => $_getSZ(2);
  @$pb.TagNumber(3)
  set country($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCountry() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountry() => clearField(3);
}

///
/// class: Brand
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOBrand extends $pb.GeneratedMessage {
  factory DTOBrand({
    $core.String? name,
    $core.Iterable<DTOCarModel>? models,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (models != null) {
      $result.models.addAll(models);
    }
    return $result;
  }
  DTOBrand._() : super();
  factory DTOBrand.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOBrand.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOBrand',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pc<DTOCarModel>(2, _omitFieldNames ? '' : 'models', $pb.PbFieldType.PM,
        subBuilder: DTOCarModel.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOBrand clone() => DTOBrand()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOBrand copyWith(void Function(DTOBrand) updates) =>
      super.copyWith((message) => updates(message as DTOBrand)) as DTOBrand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOBrand create() => DTOBrand._();
  DTOBrand createEmptyInstance() => create();
  static $pb.PbList<DTOBrand> createRepeated() => $pb.PbList<DTOBrand>();
  @$core.pragma('dart2js:noInline')
  static DTOBrand getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOBrand>(create);
  static DTOBrand? _defaultInstance;

  /// String Brand.name
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// List<CarModel> Brand.models
  @$pb.TagNumber(2)
  $core.List<DTOCarModel> get models => $_getList(1);
}

///
/// class: BodyStyle.sUv
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOSuV extends $pb.GeneratedMessage {
  factory DTOSuV({
    $core.bool? is4WD,
  }) {
    final $result = create();
    if (is4WD != null) {
      $result.is4WD = is4WD;
    }
    return $result;
  }
  DTOSuV._() : super();
  factory DTOSuV.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOSuV.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOSuV',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'is4WD', protoName: 'is4WD')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOSuV clone() => DTOSuV()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOSuV copyWith(void Function(DTOSuV) updates) =>
      super.copyWith((message) => updates(message as DTOSuV)) as DTOSuV;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOSuV create() => DTOSuV._();
  DTOSuV createEmptyInstance() => create();
  static $pb.PbList<DTOSuV> createRepeated() => $pb.PbList<DTOSuV>();
  @$core.pragma('dart2js:noInline')
  static DTOSuV getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOSuV>(create);
  static DTOSuV? _defaultInstance;

  /// bool SuV.is4WD
  @$pb.TagNumber(1)
  $core.bool get is4WD => $_getBF(0);
  @$pb.TagNumber(1)
  set is4WD($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIs4WD() => $_has(0);
  @$pb.TagNumber(1)
  void clearIs4WD() => clearField(1);
}

///
/// class: BodyStyle.coupe
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOCoupe extends $pb.GeneratedMessage {
  factory DTOCoupe({
    $core.bool? isFoldingRoof,
  }) {
    final $result = create();
    if (isFoldingRoof != null) {
      $result.isFoldingRoof = isFoldingRoof;
    }
    return $result;
  }
  DTOCoupe._() : super();
  factory DTOCoupe.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOCoupe.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOCoupe',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isFoldingRoof', protoName: 'isFoldingRoof')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOCoupe clone() => DTOCoupe()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOCoupe copyWith(void Function(DTOCoupe) updates) =>
      super.copyWith((message) => updates(message as DTOCoupe)) as DTOCoupe;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOCoupe create() => DTOCoupe._();
  DTOCoupe createEmptyInstance() => create();
  static $pb.PbList<DTOCoupe> createRepeated() => $pb.PbList<DTOCoupe>();
  @$core.pragma('dart2js:noInline')
  static DTOCoupe getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOCoupe>(create);
  static DTOCoupe? _defaultInstance;

  /// bool Coupe.isFoldingRoof
  @$pb.TagNumber(1)
  $core.bool get isFoldingRoof => $_getBF(0);
  @$pb.TagNumber(1)
  set isFoldingRoof($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsFoldingRoof() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsFoldingRoof() => clearField(1);
}

///
/// class: BodyStyle.pickup
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOPickup extends $pb.GeneratedMessage {
  factory DTOPickup({
    $core.double? cargoSpace,
  }) {
    final $result = create();
    if (cargoSpace != null) {
      $result.cargoSpace = cargoSpace;
    }
    return $result;
  }
  DTOPickup._() : super();
  factory DTOPickup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOPickup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOPickup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1, _omitFieldNames ? '' : 'cargoSpace', $pb.PbFieldType.OD,
        protoName: 'cargoSpace')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOPickup clone() => DTOPickup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOPickup copyWith(void Function(DTOPickup) updates) =>
      super.copyWith((message) => updates(message as DTOPickup)) as DTOPickup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOPickup create() => DTOPickup._();
  DTOPickup createEmptyInstance() => create();
  static $pb.PbList<DTOPickup> createRepeated() => $pb.PbList<DTOPickup>();
  @$core.pragma('dart2js:noInline')
  static DTOPickup getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOPickup>(create);
  static DTOPickup? _defaultInstance;

  /// double Pickup.cargoSpace
  @$pb.TagNumber(1)
  $core.double get cargoSpace => $_getN(0);
  @$pb.TagNumber(1)
  set cargoSpace($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCargoSpace() => $_has(0);
  @$pb.TagNumber(1)
  void clearCargoSpace() => clearField(1);
}

enum DTOBodyStyle_Union_Bodystyle { suv, coupe, pickup, notSet }

///
///  class: bodystyle
class DTOBodyStyle_Union extends $pb.GeneratedMessage {
  factory DTOBodyStyle_Union({
    DTOSuV? suv,
    DTOCoupe? coupe,
    DTOPickup? pickup,
  }) {
    final $result = create();
    if (suv != null) {
      $result.suv = suv;
    }
    if (coupe != null) {
      $result.coupe = coupe;
    }
    if (pickup != null) {
      $result.pickup = pickup;
    }
    return $result;
  }
  DTOBodyStyle_Union._() : super();
  factory DTOBodyStyle_Union.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOBodyStyle_Union.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DTOBodyStyle_Union_Bodystyle>
      _DTOBodyStyle_Union_BodystyleByTag = {
    1: DTOBodyStyle_Union_Bodystyle.suv,
    2: DTOBodyStyle_Union_Bodystyle.coupe,
    3: DTOBodyStyle_Union_Bodystyle.pickup,
    0: DTOBodyStyle_Union_Bodystyle.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOBodyStyle_Union',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<DTOSuV>(1, _omitFieldNames ? '' : 'suv', subBuilder: DTOSuV.create)
    ..aOM<DTOCoupe>(2, _omitFieldNames ? '' : 'coupe',
        subBuilder: DTOCoupe.create)
    ..aOM<DTOPickup>(3, _omitFieldNames ? '' : 'pickup',
        subBuilder: DTOPickup.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOBodyStyle_Union clone() => DTOBodyStyle_Union()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOBodyStyle_Union copyWith(void Function(DTOBodyStyle_Union) updates) =>
      super.copyWith((message) => updates(message as DTOBodyStyle_Union))
          as DTOBodyStyle_Union;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOBodyStyle_Union create() => DTOBodyStyle_Union._();
  DTOBodyStyle_Union createEmptyInstance() => create();
  static $pb.PbList<DTOBodyStyle_Union> createRepeated() =>
      $pb.PbList<DTOBodyStyle_Union>();
  @$core.pragma('dart2js:noInline')
  static DTOBodyStyle_Union getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOBodyStyle_Union>(create);
  static DTOBodyStyle_Union? _defaultInstance;

  DTOBodyStyle_Union_Bodystyle whichBodystyle() =>
      _DTOBodyStyle_Union_BodystyleByTag[$_whichOneof(0)]!;
  void clearBodystyle() => clearField($_whichOneof(0));

  /// class SuV
  @$pb.TagNumber(1)
  DTOSuV get suv => $_getN(0);
  @$pb.TagNumber(1)
  set suv(DTOSuV v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuv() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuv() => clearField(1);
  @$pb.TagNumber(1)
  DTOSuV ensureSuv() => $_ensure(0);

  /// class Coupe
  @$pb.TagNumber(2)
  DTOCoupe get coupe => $_getN(1);
  @$pb.TagNumber(2)
  set coupe(DTOCoupe v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCoupe() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoupe() => clearField(2);
  @$pb.TagNumber(2)
  DTOCoupe ensureCoupe() => $_ensure(1);

  /// class Pickup
  @$pb.TagNumber(3)
  DTOPickup get pickup => $_getN(2);
  @$pb.TagNumber(3)
  set pickup(DTOPickup v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPickup() => $_has(2);
  @$pb.TagNumber(3)
  void clearPickup() => clearField(3);
  @$pb.TagNumber(3)
  DTOPickup ensurePickup() => $_ensure(2);
}

///
/// class: GasolineEngine
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOGasolineEngine extends $pb.GeneratedMessage {
  factory DTOGasolineEngine({
    $core.int? hp,
    $core.double? fuelConsumption,
  }) {
    final $result = create();
    if (hp != null) {
      $result.hp = hp;
    }
    if (fuelConsumption != null) {
      $result.fuelConsumption = fuelConsumption;
    }
    return $result;
  }
  DTOGasolineEngine._() : super();
  factory DTOGasolineEngine.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOGasolineEngine.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOGasolineEngine',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'hp', $pb.PbFieldType.O3)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'fuelConsumption', $pb.PbFieldType.OD,
        protoName: 'fuelConsumption')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOGasolineEngine clone() => DTOGasolineEngine()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOGasolineEngine copyWith(void Function(DTOGasolineEngine) updates) =>
      super.copyWith((message) => updates(message as DTOGasolineEngine))
          as DTOGasolineEngine;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOGasolineEngine create() => DTOGasolineEngine._();
  DTOGasolineEngine createEmptyInstance() => create();
  static $pb.PbList<DTOGasolineEngine> createRepeated() =>
      $pb.PbList<DTOGasolineEngine>();
  @$core.pragma('dart2js:noInline')
  static DTOGasolineEngine getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOGasolineEngine>(create);
  static DTOGasolineEngine? _defaultInstance;

  /// int GasolineEngine.hp
  @$pb.TagNumber(1)
  $core.int get hp => $_getIZ(0);
  @$pb.TagNumber(1)
  set hp($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHp() => $_has(0);
  @$pb.TagNumber(1)
  void clearHp() => clearField(1);

  /// double GasolineEngine.fuelConsumption
  @$pb.TagNumber(2)
  $core.double get fuelConsumption => $_getN(1);
  @$pb.TagNumber(2)
  set fuelConsumption($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFuelConsumption() => $_has(1);
  @$pb.TagNumber(2)
  void clearFuelConsumption() => clearField(2);
}

///
/// class: DiselEngine
/// Source: 'package:/exap/lib/models/auto.dart';
class DTODiselEngine extends $pb.GeneratedMessage {
  factory DTODiselEngine({
    $core.int? hp,
    $core.double? fuelConsumption,
  }) {
    final $result = create();
    if (hp != null) {
      $result.hp = hp;
    }
    if (fuelConsumption != null) {
      $result.fuelConsumption = fuelConsumption;
    }
    return $result;
  }
  DTODiselEngine._() : super();
  factory DTODiselEngine.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTODiselEngine.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTODiselEngine',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'hp', $pb.PbFieldType.O3)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'fuelConsumption', $pb.PbFieldType.OD,
        protoName: 'fuelConsumption')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTODiselEngine clone() => DTODiselEngine()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTODiselEngine copyWith(void Function(DTODiselEngine) updates) =>
      super.copyWith((message) => updates(message as DTODiselEngine))
          as DTODiselEngine;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTODiselEngine create() => DTODiselEngine._();
  DTODiselEngine createEmptyInstance() => create();
  static $pb.PbList<DTODiselEngine> createRepeated() =>
      $pb.PbList<DTODiselEngine>();
  @$core.pragma('dart2js:noInline')
  static DTODiselEngine getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTODiselEngine>(create);
  static DTODiselEngine? _defaultInstance;

  /// int DiselEngine.hp
  @$pb.TagNumber(1)
  $core.int get hp => $_getIZ(0);
  @$pb.TagNumber(1)
  set hp($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHp() => $_has(0);
  @$pb.TagNumber(1)
  void clearHp() => clearField(1);

  /// double DiselEngine.fuelConsumption
  @$pb.TagNumber(2)
  $core.double get fuelConsumption => $_getN(1);
  @$pb.TagNumber(2)
  set fuelConsumption($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFuelConsumption() => $_has(1);
  @$pb.TagNumber(2)
  void clearFuelConsumption() => clearField(2);
}

///
/// class: ElectricEngine
/// Source: 'package:/exap/lib/models/auto.dart';
class DTOElectricEngine extends $pb.GeneratedMessage {
  factory DTOElectricEngine({
    $core.int? hp,
  }) {
    final $result = create();
    if (hp != null) {
      $result.hp = hp;
    }
    return $result;
  }
  DTOElectricEngine._() : super();
  factory DTOElectricEngine.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOElectricEngine.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOElectricEngine',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'hp', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOElectricEngine clone() => DTOElectricEngine()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOElectricEngine copyWith(void Function(DTOElectricEngine) updates) =>
      super.copyWith((message) => updates(message as DTOElectricEngine))
          as DTOElectricEngine;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOElectricEngine create() => DTOElectricEngine._();
  DTOElectricEngine createEmptyInstance() => create();
  static $pb.PbList<DTOElectricEngine> createRepeated() =>
      $pb.PbList<DTOElectricEngine>();
  @$core.pragma('dart2js:noInline')
  static DTOElectricEngine getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOElectricEngine>(create);
  static DTOElectricEngine? _defaultInstance;

  /// int ElectricEngine.hp
  @$pb.TagNumber(1)
  $core.int get hp => $_getIZ(0);
  @$pb.TagNumber(1)
  set hp($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHp() => $_has(0);
  @$pb.TagNumber(1)
  void clearHp() => clearField(1);
}

enum DTOEngine_Union_Engine {
  gasolineengine,
  diselengine,
  electricengine,
  notSet
}

///
///  class: engine
class DTOEngine_Union extends $pb.GeneratedMessage {
  factory DTOEngine_Union({
    DTOGasolineEngine? gasolineengine,
    DTODiselEngine? diselengine,
    DTOElectricEngine? electricengine,
  }) {
    final $result = create();
    if (gasolineengine != null) {
      $result.gasolineengine = gasolineengine;
    }
    if (diselengine != null) {
      $result.diselengine = diselengine;
    }
    if (electricengine != null) {
      $result.electricengine = electricengine;
    }
    return $result;
  }
  DTOEngine_Union._() : super();
  factory DTOEngine_Union.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOEngine_Union.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, DTOEngine_Union_Engine>
      _DTOEngine_Union_EngineByTag = {
    1: DTOEngine_Union_Engine.gasolineengine,
    2: DTOEngine_Union_Engine.diselengine,
    3: DTOEngine_Union_Engine.electricengine,
    0: DTOEngine_Union_Engine.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOEngine_Union',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<DTOGasolineEngine>(1, _omitFieldNames ? '' : 'gasolineengine',
        subBuilder: DTOGasolineEngine.create)
    ..aOM<DTODiselEngine>(2, _omitFieldNames ? '' : 'diselengine',
        subBuilder: DTODiselEngine.create)
    ..aOM<DTOElectricEngine>(3, _omitFieldNames ? '' : 'electricengine',
        subBuilder: DTOElectricEngine.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOEngine_Union clone() => DTOEngine_Union()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOEngine_Union copyWith(void Function(DTOEngine_Union) updates) =>
      super.copyWith((message) => updates(message as DTOEngine_Union))
          as DTOEngine_Union;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOEngine_Union create() => DTOEngine_Union._();
  DTOEngine_Union createEmptyInstance() => create();
  static $pb.PbList<DTOEngine_Union> createRepeated() =>
      $pb.PbList<DTOEngine_Union>();
  @$core.pragma('dart2js:noInline')
  static DTOEngine_Union getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DTOEngine_Union>(create);
  static DTOEngine_Union? _defaultInstance;

  DTOEngine_Union_Engine whichEngine() =>
      _DTOEngine_Union_EngineByTag[$_whichOneof(0)]!;
  void clearEngine() => clearField($_whichOneof(0));

  /// class GasolineEngine
  @$pb.TagNumber(1)
  DTOGasolineEngine get gasolineengine => $_getN(0);
  @$pb.TagNumber(1)
  set gasolineengine(DTOGasolineEngine v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGasolineengine() => $_has(0);
  @$pb.TagNumber(1)
  void clearGasolineengine() => clearField(1);
  @$pb.TagNumber(1)
  DTOGasolineEngine ensureGasolineengine() => $_ensure(0);

  /// class DiselEngine
  @$pb.TagNumber(2)
  DTODiselEngine get diselengine => $_getN(1);
  @$pb.TagNumber(2)
  set diselengine(DTODiselEngine v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDiselengine() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiselengine() => clearField(2);
  @$pb.TagNumber(2)
  DTODiselEngine ensureDiselengine() => $_ensure(1);

  /// class ElectricEngine
  @$pb.TagNumber(3)
  DTOElectricEngine get electricengine => $_getN(2);
  @$pb.TagNumber(3)
  set electricengine(DTOElectricEngine v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasElectricengine() => $_has(2);
  @$pb.TagNumber(3)
  void clearElectricengine() => clearField(3);
  @$pb.TagNumber(3)
  DTOElectricEngine ensureElectricengine() => $_ensure(2);
}

///
/// class: User
/// Source: 'package:/exap/lib/models/model.dart';
class DTOUser extends $pb.GeneratedMessage {
  factory DTOUser({
    $core.String? name,
    $core.int? age,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (age != null) {
      $result.age = age;
    }
    return $result;
  }
  DTOUser._() : super();
  factory DTOUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DTOUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DTOUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'messages'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DTOUser clone() => DTOUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DTOUser copyWith(void Function(DTOUser) updates) =>
      super.copyWith((message) => updates(message as DTOUser)) as DTOUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DTOUser create() => DTOUser._();
  DTOUser createEmptyInstance() => create();
  static $pb.PbList<DTOUser> createRepeated() => $pb.PbList<DTOUser>();
  @$core.pragma('dart2js:noInline')
  static DTOUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DTOUser>(create);
  static DTOUser? _defaultInstance;

  /// String User.name
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  /// int User.age
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
    $core.Iterable<$core.String>? dates,
    $core.bool? bolean,
    $core.double? weight,
    $core.int? height,
    $core.String? nullableString,
    $core.String? nullableDateTime,
  }) {
    final $result = create();
    if (dates != null) {
      $result.dates.addAll(dates);
    }
    if (bolean != null) {
      $result.bolean = bolean;
    }
    if (weight != null) {
      $result.weight = weight;
    }
    if (height != null) {
      $result.height = height;
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
    ..pPS(1, _omitFieldNames ? '' : 'dates')
    ..aOB(2, _omitFieldNames ? '' : 'bolean')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'weight', $pb.PbFieldType.OD)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'nullableString',
        protoName: 'nullableString')
    ..aOS(6, _omitFieldNames ? '' : 'nullableDateTime',
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

  /// List<DateTime>? Cow.dates
  @$pb.TagNumber(1)
  $core.List<$core.String> get dates => $_getList(0);

  /// bool Cow.bolean
  @$pb.TagNumber(2)
  $core.bool get bolean => $_getBF(1);
  @$pb.TagNumber(2)
  set bolean($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBolean() => $_has(1);
  @$pb.TagNumber(2)
  void clearBolean() => clearField(2);

  /// double Cow.weight
  @$pb.TagNumber(3)
  $core.double get weight => $_getN(2);
  @$pb.TagNumber(3)
  set weight($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeight() => clearField(3);

  /// int? Cow.height
  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  /// String? Cow.nullableString
  @$pb.TagNumber(5)
  $core.String get nullableString => $_getSZ(4);
  @$pb.TagNumber(5)
  set nullableString($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNullableString() => $_has(4);
  @$pb.TagNumber(5)
  void clearNullableString() => clearField(5);

  /// DateTime? Cow.nullableDateTime
  @$pb.TagNumber(6)
  $core.String get nullableDateTime => $_getSZ(5);
  @$pb.TagNumber(6)
  set nullableDateTime($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNullableDateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearNullableDateTime() => clearField(6);
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
