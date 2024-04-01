//
//  Generated code. Do not modify.
//  source: messages.g.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use dTOCorpusDescriptor instead')
const DTOCorpus$json = {
  '1': 'DTOCorpus',
  '2': [
    {'1': 'CORPUS_UNSPECIFIED', '2': 0},
    {'1': 'CORPUS_UNIVERSAL', '2': 1},
    {'1': 'CORPUS_WEB', '2': 2},
    {'1': 'CORPUS_IMAGES', '2': 3},
    {'1': 'CORPUS_LOCAL', '2': 4},
    {'1': 'CORPUS_NEWS', '2': 5},
    {'1': 'CORPUS_PRODUCTS', '2': 6},
    {'1': 'CORPUS_VIDEO', '2': 7},
  ],
};

/// Descriptor for `DTOCorpus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dTOCorpusDescriptor = $convert.base64Decode(
    'CglEVE9Db3JwdXMSFgoSQ09SUFVTX1VOU1BFQ0lGSUVEEAASFAoQQ09SUFVTX1VOSVZFUlNBTB'
    'ABEg4KCkNPUlBVU19XRUIQAhIRCg1DT1JQVVNfSU1BR0VTEAMSEAoMQ09SUFVTX0xPQ0FMEAQS'
    'DwoLQ09SUFVTX05FV1MQBRITCg9DT1JQVVNfUFJPRFVDVFMQBhIQCgxDT1JQVVNfVklERU8QBw'
    '==');

@$core.Deprecated('Use dTOGearsDescriptor instead')
const DTOGears$json = {
  '1': 'DTOGears',
  '2': [
    {'1': 'NAMUAL', '2': 0},
    {'1': 'AUTO', '2': 1},
  ],
};

/// Descriptor for `DTOGears`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dTOGearsDescriptor =
    $convert.base64Decode('CghEVE9HZWFycxIKCgZOQU1VQUwQABIICgRBVVRPEAE=');

@$core.Deprecated('Use dTOColorsDescriptor instead')
const DTOColors$json = {
  '1': 'DTOColors',
  '2': [
    {'1': 'RED', '2': 0},
    {'1': 'BLUE', '2': 1},
    {'1': 'GREEN', '2': 2},
    {'1': 'WTHITE', '2': 3},
    {'1': 'BLACK', '2': 4},
  ],
};

/// Descriptor for `DTOColors`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dTOColorsDescriptor = $convert.base64Decode(
    'CglEVE9Db2xvcnMSBwoDUkVEEAASCAoEQkxVRRABEgkKBUdSRUVOEAISCgoGV1RISVRFEAMSCQ'
    'oFQkxBQ0sQBA==');

@$core.Deprecated('Use dTOAbsSecondDescriptor instead')
const DTOAbsSecond$json = {
  '1': 'DTOAbsSecond',
  '2': [
    {'1': 'a', '3': 1, '4': 1, '5': 9, '10': 'a'},
    {'1': 'b', '3': 2, '4': 1, '5': 5, '10': 'b'},
    {'1': 'c', '3': 3, '4': 1, '5': 8, '10': 'c'},
  ],
};

/// Descriptor for `DTOAbsSecond`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOAbsSecondDescriptor = $convert.base64Decode(
    'CgxEVE9BYnNTZWNvbmQSDAoBYRgBIAEoCVIBYRIMCgFiGAIgASgFUgFiEgwKAWMYAyABKAhSAW'
    'M=');

@$core.Deprecated('Use dTOAbsTherdDescriptor instead')
const DTOAbsTherd$json = {
  '1': 'DTOAbsTherd',
  '2': [
    {'1': 'd', '3': 1, '4': 1, '5': 9, '10': 'd'},
  ],
};

/// Descriptor for `DTOAbsTherd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOAbsTherdDescriptor =
    $convert.base64Decode('CgtEVE9BYnNUaGVyZBIMCgFkGAEgASgJUgFk');

@$core.Deprecated('Use dTOAbsFactories_UnionDescriptor instead')
const DTOAbsFactories_Union$json = {
  '1': 'DTOAbsFactories_Union',
  '2': [
    {
      '1': 'first',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOAbsSecond',
      '9': 0,
      '10': 'first'
    },
    {
      '1': 'second',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOAbsTherd',
      '9': 0,
      '10': 'second'
    },
  ],
  '8': [
    {'1': 'absfactories'},
  ],
};

/// Descriptor for `DTOAbsFactories_Union`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOAbsFactories_UnionDescriptor = $convert.base64Decode(
    'ChVEVE9BYnNGYWN0b3JpZXNfVW5pb24SLgoFZmlyc3QYASABKAsyFi5tZXNzYWdlcy5EVE9BYn'
    'NTZWNvbmRIAFIFZmlyc3QSLwoGc2Vjb25kGAIgASgLMhUubWVzc2FnZXMuRFRPQWJzVGhlcmRI'
    'AFIGc2Vjb25kQg4KDGFic2ZhY3Rvcmllcw==');

@$core.Deprecated('Use dTOCarModelDescriptor instead')
const DTOCarModel$json = {
  '1': 'DTOCarModel',
  '2': [
    {'1': 'produsedAt', '3': 1, '4': 1, '5': 9, '10': 'produsedAt'},
    {
      '1': 'dateOfSale',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'dateOfSale',
      '17': true
    },
    {'1': 'modelName', '3': 3, '4': 1, '5': 9, '10': 'modelName'},
    {
      '1': 'produser',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOAutomakers',
      '10': 'produser'
    },
    {
      '1': 'bodyStyles',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.messages.DTOBodyStyle_Union',
      '10': 'bodyStyles'
    },
    {'1': 'variants', '3': 6, '4': 1, '5': 9, '10': 'variants'},
    {
      '1': 'avalebleColors',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.messages.DTOColors',
      '10': 'avalebleColors'
    },
    {
      '1': 'engines',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.messages.DTOEngine_Union',
      '10': 'engines'
    },
    {
      '1': 'gear',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.messages.DTOGears',
      '10': 'gear'
    },
  ],
  '8': [
    {'1': '_dateOfSale'},
  ],
};

/// Descriptor for `DTOCarModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOCarModelDescriptor = $convert.base64Decode(
    'CgtEVE9DYXJNb2RlbBIeCgpwcm9kdXNlZEF0GAEgASgJUgpwcm9kdXNlZEF0EiMKCmRhdGVPZl'
    'NhbGUYAiABKAlIAFIKZGF0ZU9mU2FsZYgBARIcCgltb2RlbE5hbWUYAyABKAlSCW1vZGVsTmFt'
    'ZRIzCghwcm9kdXNlchgEIAEoCzIXLm1lc3NhZ2VzLkRUT0F1dG9tYWtlcnNSCHByb2R1c2VyEj'
    'wKCmJvZHlTdHlsZXMYBSADKAsyHC5tZXNzYWdlcy5EVE9Cb2R5U3R5bGVfVW5pb25SCmJvZHlT'
    'dHlsZXMSGgoIdmFyaWFudHMYBiABKAlSCHZhcmlhbnRzEjsKDmF2YWxlYmxlQ29sb3JzGAcgAS'
    'gOMhMubWVzc2FnZXMuRFRPQ29sb3JzUg5hdmFsZWJsZUNvbG9ycxIzCgdlbmdpbmVzGAggAygL'
    'MhkubWVzc2FnZXMuRFRPRW5naW5lX1VuaW9uUgdlbmdpbmVzEiYKBGdlYXIYCSABKA4yEi5tZX'
    'NzYWdlcy5EVE9HZWFyc1IEZ2VhckINCgtfZGF0ZU9mU2FsZQ==');

@$core.Deprecated('Use dTOAutomakersDescriptor instead')
const DTOAutomakers$json = {
  '1': 'DTOAutomakers',
  '2': [
    {'1': 'brands', '3': 1, '4': 3, '5': 9, '10': 'brands'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'country', '3': 3, '4': 1, '5': 9, '10': 'country'},
  ],
};

/// Descriptor for `DTOAutomakers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOAutomakersDescriptor = $convert.base64Decode(
    'Cg1EVE9BdXRvbWFrZXJzEhYKBmJyYW5kcxgBIAMoCVIGYnJhbmRzEhIKBG5hbWUYAiABKAlSBG'
    '5hbWUSGAoHY291bnRyeRgDIAEoCVIHY291bnRyeQ==');

@$core.Deprecated('Use dTOBrandDescriptor instead')
const DTOBrand$json = {
  '1': 'DTOBrand',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'models',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.messages.DTOCarModel',
      '10': 'models'
    },
  ],
};

/// Descriptor for `DTOBrand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOBrandDescriptor = $convert.base64Decode(
    'CghEVE9CcmFuZBISCgRuYW1lGAEgASgJUgRuYW1lEi0KBm1vZGVscxgCIAMoCzIVLm1lc3NhZ2'
    'VzLkRUT0Nhck1vZGVsUgZtb2RlbHM=');

@$core.Deprecated('Use dTOSuVDescriptor instead')
const DTOSuV$json = {
  '1': 'DTOSuV',
  '2': [
    {'1': 'is4WD', '3': 1, '4': 1, '5': 8, '10': 'is4WD'},
  ],
};

/// Descriptor for `DTOSuV`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOSuVDescriptor =
    $convert.base64Decode('CgZEVE9TdVYSFAoFaXM0V0QYASABKAhSBWlzNFdE');

@$core.Deprecated('Use dTOCoupeDescriptor instead')
const DTOCoupe$json = {
  '1': 'DTOCoupe',
  '2': [
    {'1': 'isFoldingRoof', '3': 1, '4': 1, '5': 8, '10': 'isFoldingRoof'},
  ],
};

/// Descriptor for `DTOCoupe`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOCoupeDescriptor = $convert.base64Decode(
    'CghEVE9Db3VwZRIkCg1pc0ZvbGRpbmdSb29mGAEgASgIUg1pc0ZvbGRpbmdSb29m');

@$core.Deprecated('Use dTOPickupDescriptor instead')
const DTOPickup$json = {
  '1': 'DTOPickup',
  '2': [
    {'1': 'cargoSpace', '3': 1, '4': 1, '5': 1, '10': 'cargoSpace'},
  ],
};

/// Descriptor for `DTOPickup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOPickupDescriptor = $convert.base64Decode(
    'CglEVE9QaWNrdXASHgoKY2FyZ29TcGFjZRgBIAEoAVIKY2FyZ29TcGFjZQ==');

@$core.Deprecated('Use dTOBodyStyle_UnionDescriptor instead')
const DTOBodyStyle_Union$json = {
  '1': 'DTOBodyStyle_Union',
  '2': [
    {
      '1': 'suv',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOSuV',
      '9': 0,
      '10': 'suv'
    },
    {
      '1': 'coupe',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOCoupe',
      '9': 0,
      '10': 'coupe'
    },
    {
      '1': 'pickup',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOPickup',
      '9': 0,
      '10': 'pickup'
    },
  ],
  '8': [
    {'1': 'bodystyle'},
  ],
};

/// Descriptor for `DTOBodyStyle_Union`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOBodyStyle_UnionDescriptor = $convert.base64Decode(
    'ChJEVE9Cb2R5U3R5bGVfVW5pb24SJAoDc3V2GAEgASgLMhAubWVzc2FnZXMuRFRPU3VWSABSA3'
    'N1dhIqCgVjb3VwZRgCIAEoCzISLm1lc3NhZ2VzLkRUT0NvdXBlSABSBWNvdXBlEi0KBnBpY2t1'
    'cBgDIAEoCzITLm1lc3NhZ2VzLkRUT1BpY2t1cEgAUgZwaWNrdXBCCwoJYm9keXN0eWxl');

@$core.Deprecated('Use dTOGasolineEngineDescriptor instead')
const DTOGasolineEngine$json = {
  '1': 'DTOGasolineEngine',
  '2': [
    {'1': 'hp', '3': 1, '4': 1, '5': 5, '10': 'hp'},
    {'1': 'fuelConsumption', '3': 2, '4': 1, '5': 1, '10': 'fuelConsumption'},
  ],
};

/// Descriptor for `DTOGasolineEngine`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOGasolineEngineDescriptor = $convert.base64Decode(
    'ChFEVE9HYXNvbGluZUVuZ2luZRIOCgJocBgBIAEoBVICaHASKAoPZnVlbENvbnN1bXB0aW9uGA'
    'IgASgBUg9mdWVsQ29uc3VtcHRpb24=');

@$core.Deprecated('Use dTODiselEngineDescriptor instead')
const DTODiselEngine$json = {
  '1': 'DTODiselEngine',
  '2': [
    {'1': 'hp', '3': 1, '4': 1, '5': 5, '10': 'hp'},
    {'1': 'fuelConsumption', '3': 2, '4': 1, '5': 1, '10': 'fuelConsumption'},
  ],
};

/// Descriptor for `DTODiselEngine`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTODiselEngineDescriptor = $convert.base64Decode(
    'Cg5EVE9EaXNlbEVuZ2luZRIOCgJocBgBIAEoBVICaHASKAoPZnVlbENvbnN1bXB0aW9uGAIgAS'
    'gBUg9mdWVsQ29uc3VtcHRpb24=');

@$core.Deprecated('Use dTOElectricEngineDescriptor instead')
const DTOElectricEngine$json = {
  '1': 'DTOElectricEngine',
  '2': [
    {'1': 'hp', '3': 1, '4': 1, '5': 5, '10': 'hp'},
  ],
};

/// Descriptor for `DTOElectricEngine`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOElectricEngineDescriptor =
    $convert.base64Decode('ChFEVE9FbGVjdHJpY0VuZ2luZRIOCgJocBgBIAEoBVICaHA=');

@$core.Deprecated('Use dTOEngine_UnionDescriptor instead')
const DTOEngine_Union$json = {
  '1': 'DTOEngine_Union',
  '2': [
    {
      '1': 'gasolineengine',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOGasolineEngine',
      '9': 0,
      '10': 'gasolineengine'
    },
    {
      '1': 'diselengine',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.DTODiselEngine',
      '9': 0,
      '10': 'diselengine'
    },
    {
      '1': 'electricengine',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOElectricEngine',
      '9': 0,
      '10': 'electricengine'
    },
  ],
  '8': [
    {'1': 'engine'},
  ],
};

/// Descriptor for `DTOEngine_Union`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOEngine_UnionDescriptor = $convert.base64Decode(
    'Cg9EVE9FbmdpbmVfVW5pb24SRQoOZ2Fzb2xpbmVlbmdpbmUYASABKAsyGy5tZXNzYWdlcy5EVE'
    '9HYXNvbGluZUVuZ2luZUgAUg5nYXNvbGluZWVuZ2luZRI8CgtkaXNlbGVuZ2luZRgCIAEoCzIY'
    'Lm1lc3NhZ2VzLkRUT0Rpc2VsRW5naW5lSABSC2Rpc2VsZW5naW5lEkUKDmVsZWN0cmljZW5naW'
    '5lGAMgASgLMhsubWVzc2FnZXMuRFRPRWxlY3RyaWNFbmdpbmVIAFIOZWxlY3RyaWNlbmdpbmVC'
    'CAoGZW5naW5l');

@$core.Deprecated('Use dTOUserDescriptor instead')
const DTOUser$json = {
  '1': 'DTOUser',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 2, '4': 1, '5': 5, '10': 'age'},
  ],
};

/// Descriptor for `DTOUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOUserDescriptor = $convert.base64Decode(
    'CgdEVE9Vc2VyEhIKBG5hbWUYASABKAlSBG5hbWUSEAoDYWdlGAIgASgFUgNhZ2U=');

@$core.Deprecated('Use dTOPersonDescriptor instead')
const DTOPerson$json = {
  '1': 'DTOPerson',
  '2': [
    {'1': 'createdAt', '3': 1, '4': 1, '5': 9, '10': 'createdAt'},
    {
      '1': 'blahs',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.messages.DTOBlah',
      '10': 'blahs'
    },
  ],
};

/// Descriptor for `DTOPerson`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOPersonDescriptor = $convert.base64Decode(
    'CglEVE9QZXJzb24SHAoJY3JlYXRlZEF0GAEgASgJUgljcmVhdGVkQXQSJwoFYmxhaHMYAiADKA'
    'syES5tZXNzYWdlcy5EVE9CbGFoUgVibGFocw==');

@$core.Deprecated('Use dTOBlahDescriptor instead')
const DTOBlah$json = {
  '1': 'DTOBlah',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'tags', '3': 2, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'price', '3': 3, '4': 1, '5': 1, '10': 'price'},
    {'1': 'isVerifyed', '3': 4, '4': 1, '5': 8, '10': 'isVerifyed'},
    {'1': 'settings', '3': 5, '4': 1, '5': 9, '10': 'settings'},
    {'1': 'count', '3': 6, '4': 1, '5': 5, '9': 0, '10': 'count', '17': true},
  ],
  '8': [
    {'1': '_count'},
  ],
};

/// Descriptor for `DTOBlah`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOBlahDescriptor = $convert.base64Decode(
    'CgdEVE9CbGFoEg4KAmlkGAEgASgJUgJpZBISCgR0YWdzGAIgAygJUgR0YWdzEhQKBXByaWNlGA'
    'MgASgBUgVwcmljZRIeCgppc1ZlcmlmeWVkGAQgASgIUgppc1ZlcmlmeWVkEhoKCHNldHRpbmdz'
    'GAUgASgJUghzZXR0aW5ncxIZCgVjb3VudBgGIAEoBUgAUgVjb3VudIgBAUIICgZfY291bnQ=');

@$core.Deprecated('Use dTOErrorDetailsDescriptor instead')
const DTOErrorDetails$json = {
  '1': 'DTOErrorDetails',
  '2': [
    {
      '1': 'message',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `DTOErrorDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOErrorDetailsDescriptor = $convert.base64Decode(
    'Cg9EVE9FcnJvckRldGFpbHMSHQoHbWVzc2FnZRgBIAEoCUgAUgdtZXNzYWdliAEBQgoKCF9tZX'
    'NzYWdl');

@$core.Deprecated('Use dTOComplexDescriptor instead')
const DTOComplex$json = {
  '1': 'DTOComplex',
  '2': [
    {'1': 'a', '3': 1, '4': 1, '5': 5, '10': 'a'},
    {'1': 'b', '3': 2, '4': 1, '5': 9, '10': 'b'},
  ],
};

/// Descriptor for `DTOComplex`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOComplexDescriptor = $convert
    .base64Decode('CgpEVE9Db21wbGV4EgwKAWEYASABKAVSAWESDAoBYhgCIAEoCVIBYg==');

@$core.Deprecated('Use dTOFreezedCl_UnionDescriptor instead')
const DTOFreezedCl_Union$json = {
  '1': 'DTOFreezedCl_Union',
  '2': [
    {
      '1': 'error',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOErrorDetails',
      '9': 0,
      '10': 'error'
    },
    {
      '1': 'complex',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOComplex',
      '9': 0,
      '10': 'complex'
    },
  ],
  '8': [
    {'1': 'freezedcl'},
  ],
};

/// Descriptor for `DTOFreezedCl_Union`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOFreezedCl_UnionDescriptor = $convert.base64Decode(
    'ChJEVE9GcmVlemVkQ2xfVW5pb24SMQoFZXJyb3IYASABKAsyGS5tZXNzYWdlcy5EVE9FcnJvck'
    'RldGFpbHNIAFIFZXJyb3ISMAoHY29tcGxleBgCIAEoCzIULm1lc3NhZ2VzLkRUT0NvbXBsZXhI'
    'AFIHY29tcGxleEILCglmcmVlemVkY2w=');

@$core.Deprecated('Use dTOCowDescriptor instead')
const DTOCow$json = {
  '1': 'DTOCow',
  '2': [
    {'1': 'dates', '3': 1, '4': 3, '5': 9, '10': 'dates'},
    {'1': 'bolean', '3': 2, '4': 1, '5': 8, '10': 'bolean'},
    {'1': 'weight', '3': 3, '4': 1, '5': 1, '10': 'weight'},
    {'1': 'height', '3': 4, '4': 1, '5': 5, '9': 0, '10': 'height', '17': true},
    {
      '1': 'nullableString',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'nullableString',
      '17': true
    },
    {
      '1': 'nullableDateTime',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'nullableDateTime',
      '17': true
    },
  ],
  '8': [
    {'1': '_height'},
    {'1': '_nullableString'},
    {'1': '_nullableDateTime'},
  ],
};

/// Descriptor for `DTOCow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOCowDescriptor = $convert.base64Decode(
    'CgZEVE9Db3cSFAoFZGF0ZXMYASADKAlSBWRhdGVzEhYKBmJvbGVhbhgCIAEoCFIGYm9sZWFuEh'
    'YKBndlaWdodBgDIAEoAVIGd2VpZ2h0EhsKBmhlaWdodBgEIAEoBUgAUgZoZWlnaHSIAQESKwoO'
    'bnVsbGFibGVTdHJpbmcYBSABKAlIAVIObnVsbGFibGVTdHJpbmeIAQESLwoQbnVsbGFibGVEYX'
    'RlVGltZRgGIAEoCUgCUhBudWxsYWJsZURhdGVUaW1liAEBQgkKB19oZWlnaHRCEQoPX251bGxh'
    'YmxlU3RyaW5nQhMKEV9udWxsYWJsZURhdGVUaW1l');

@$core.Deprecated('Use dTOSheepDescriptor instead')
const DTOSheep$json = {
  '1': 'DTOSheep',
  '2': [
    {'1': 'one', '3': 1, '4': 1, '5': 9, '10': 'one'},
  ],
};

/// Descriptor for `DTOSheep`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOSheepDescriptor =
    $convert.base64Decode('CghEVE9TaGVlcBIQCgNvbmUYASABKAlSA29uZQ==');

@$core.Deprecated('Use dTOPigDescriptor instead')
const DTOPig$json = {
  '1': 'DTOPig',
  '2': [
    {'1': 'se', '3': 1, '4': 1, '5': 1, '10': 'se'},
  ],
};

/// Descriptor for `DTOPig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOPigDescriptor =
    $convert.base64Decode('CgZEVE9QaWcSDgoCc2UYASABKAFSAnNl');

@$core.Deprecated('Use dTOAnimal_UnionDescriptor instead')
const DTOAnimal_Union$json = {
  '1': 'DTOAnimal_Union',
  '2': [
    {
      '1': 'cow',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOCow',
      '9': 0,
      '10': 'cow'
    },
    {
      '1': 'sheep',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOSheep',
      '9': 0,
      '10': 'sheep'
    },
    {
      '1': 'pig',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.messages.DTOPig',
      '9': 0,
      '10': 'pig'
    },
  ],
  '8': [
    {'1': 'animal'},
  ],
};

/// Descriptor for `DTOAnimal_Union`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOAnimal_UnionDescriptor = $convert.base64Decode(
    'Cg9EVE9BbmltYWxfVW5pb24SJAoDY293GAEgASgLMhAubWVzc2FnZXMuRFRPQ293SABSA2Nvdx'
    'IqCgVzaGVlcBgCIAEoCzISLm1lc3NhZ2VzLkRUT1NoZWVwSABSBXNoZWVwEiQKA3BpZxgDIAEo'
    'CzIQLm1lc3NhZ2VzLkRUT1BpZ0gAUgNwaWdCCAoGYW5pbWFs');
