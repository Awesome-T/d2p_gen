//
//  Generated code. Do not modify.
//  source: proto/messages.proto
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

@$core.Deprecated('Use dTOErrorCodeExeptionsDescriptor instead')
const DTOErrorCodeExeptions$json = {
  '1': 'DTOErrorCodeExeptions',
  '2': [
    {'1': 'PERMISSION_NOT_FINDED', '2': 0},
    {'1': 'NETWORK_EX', '2': 1},
  ],
};

/// Descriptor for `DTOErrorCodeExeptions`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dTOErrorCodeExeptionsDescriptor = $convert.base64Decode(
    'ChVEVE9FcnJvckNvZGVFeGVwdGlvbnMSGQoVUEVSTUlTU0lPTl9OT1RfRklOREVEEAASDgoKTk'
    'VUV09SS19FWBAB');

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

@$core.Deprecated('Use dTOFirstLevelDescriptor instead')
const DTOFirstLevel$json = {
  '1': 'DTOFirstLevel',
  '2': [
    {'1': 'dt', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'dt', '17': true},
    {'1': 'ninew', '3': 2, '4': 1, '5': 1, '10': 'ninew'},
    {'1': 'pwqwq', '3': 3, '4': 1, '5': 1, '9': 1, '10': 'pwqwq', '17': true},
    {
      '1': 'nesyed',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.messages.DTOSecondLevel',
      '10': 'nesyed'
    },
    {'1': 'mapa', '3': 5, '4': 1, '5': 9, '10': 'mapa'},
    {'1': 'one', '3': 6, '4': 1, '5': 5, '10': 'one'},
    {'1': 'three', '3': 7, '4': 1, '5': 9, '10': 'three'},
    {'1': 'seven', '3': 8, '4': 1, '5': 8, '10': 'seven'},
    {'1': 'nine', '3': 9, '4': 3, '5': 9, '10': 'nine'},
    {'1': 'ten', '3': 10, '4': 1, '5': 9, '10': 'ten'},
    {'1': 'zerro', '3': 11, '4': 1, '5': 5, '9': 2, '10': 'zerro', '17': true},
    {'1': 'float', '3': 12, '4': 3, '5': 1, '10': 'float'},
    {'1': 'two', '3': 13, '4': 1, '5': 9, '9': 3, '10': 'two', '17': true},
    {'1': 'eight', '3': 14, '4': 1, '5': 8, '9': 4, '10': 'eight', '17': true},
  ],
  '8': [
    {'1': '_dt'},
    {'1': '_pwqwq'},
    {'1': '_zerro'},
    {'1': '_two'},
    {'1': '_eight'},
  ],
};

/// Descriptor for `DTOFirstLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOFirstLevelDescriptor = $convert.base64Decode(
    'Cg1EVE9GaXJzdExldmVsEhMKAmR0GAEgASgJSABSAmR0iAEBEhQKBW5pbmV3GAIgASgBUgVuaW'
    '5ldxIZCgVwd3F3cRgDIAEoAUgBUgVwd3F3cYgBARIwCgZuZXN5ZWQYBCADKAsyGC5tZXNzYWdl'
    'cy5EVE9TZWNvbmRMZXZlbFIGbmVzeWVkEhIKBG1hcGEYBSABKAlSBG1hcGESEAoDb25lGAYgAS'
    'gFUgNvbmUSFAoFdGhyZWUYByABKAlSBXRocmVlEhQKBXNldmVuGAggASgIUgVzZXZlbhISCgRu'
    'aW5lGAkgAygJUgRuaW5lEhAKA3RlbhgKIAEoCVIDdGVuEhkKBXplcnJvGAsgASgFSAJSBXplcn'
    'JviAEBEhQKBWZsb2F0GAwgAygBUgVmbG9hdBIVCgN0d28YDSABKAlIA1IDdHdviAEBEhkKBWVp'
    'Z2h0GA4gASgISARSBWVpZ2h0iAEBQgUKA19kdEIICgZfcHdxd3FCCAoGX3plcnJvQgYKBF90d2'
    '9CCAoGX2VpZ2h0');

@$core.Deprecated('Use dTOSecondLevelDescriptor instead')
const DTOSecondLevel$json = {
  '1': 'DTOSecondLevel',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 5, '10': 'count'},
    {
      '1': 'arr',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.messages.DTOTherdLevel',
      '10': 'arr'
    },
  ],
};

/// Descriptor for `DTOSecondLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOSecondLevelDescriptor = $convert.base64Decode(
    'Cg5EVE9TZWNvbmRMZXZlbBIUCgVjb3VudBgBIAEoBVIFY291bnQSKQoDYXJyGAIgAygLMhcubW'
    'Vzc2FnZXMuRFRPVGhlcmRMZXZlbFIDYXJy');

@$core.Deprecated('Use dTOTherdLevelDescriptor instead')
const DTOTherdLevel$json = {
  '1': 'DTOTherdLevel',
  '2': [
    {'1': 'count', '3': 1, '4': 3, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `DTOTherdLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOTherdLevelDescriptor = $convert
    .base64Decode('Cg1EVE9UaGVyZExldmVsEhQKBWNvdW50GAEgAygFUgVjb3VudA==');

@$core.Deprecated('Use dTOPioijhDescriptor instead')
const DTOPioijh$json = {
  '1': 'DTOPioijh',
  '2': [
    {
      '1': 'smthn',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.messages.DTOBlah',
      '10': 'smthn'
    },
    {'1': 'age', '3': 2, '4': 1, '5': 5, '10': 'age'},
  ],
};

/// Descriptor for `DTOPioijh`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOPioijhDescriptor = $convert.base64Decode(
    'CglEVE9QaW9pamgSJwoFc210aG4YASADKAsyES5tZXNzYWdlcy5EVE9CbGFoUgVzbXRobhIQCg'
    'NhZ2UYAiABKAVSA2FnZQ==');

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
    {'1': 'weight', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'weight', '17': true},
    {
      '1': 'nullableString',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'nullableString',
      '17': true
    },
    {
      '1': 'nullableDateTime',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'nullableDateTime',
      '17': true
    },
  ],
  '8': [
    {'1': '_weight'},
    {'1': '_nullableString'},
    {'1': '_nullableDateTime'},
  ],
};

/// Descriptor for `DTOCow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dTOCowDescriptor = $convert.base64Decode(
    'CgZEVE9Db3cSGwoGd2VpZ2h0GAEgASgFSABSBndlaWdodIgBARIrCg5udWxsYWJsZVN0cmluZx'
    'gCIAEoCUgBUg5udWxsYWJsZVN0cmluZ4gBARIvChBudWxsYWJsZURhdGVUaW1lGAMgASgJSAJS'
    'EG51bGxhYmxlRGF0ZVRpbWWIAQFCCQoHX3dlaWdodEIRCg9fbnVsbGFibGVTdHJpbmdCEwoRX2'
    '51bGxhYmxlRGF0ZVRpbWU=');

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
