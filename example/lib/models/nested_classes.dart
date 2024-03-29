// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:d2p_annotation/d2p_annotation.dart';

@ProtoGen(
  createMappers: true,
  singleProtofile: false,
)
class FirstLevel {
  const FirstLevel(
    this.dt,
    this.ninew,
    this.pwqwq,
    this.nesyed,
    this.arrOfEnums, {
    required this.mapa,
    required this.one,
    required this.three,
    required this.seven,
    required this.nine,
    required this.ten,
    this.zerro,
    this.float,
    this.two,
    this.eight,
  });

  final DateTime? dt;
  final bool? eight;
  final List<double>? float;
  final List<SecondLevel> nesyed;
  final List<EnumForArr> arrOfEnums;
  final Map<String, dynamic> mapa;

  final List<DateTime> nine;
  final double ninew;
  final int one;
  final double? pwqwq;
  final bool seven;
  final DateTime ten;
  final String three;
  final String? two;
  final int? zerro;
}

@ProtoGen(createMappers: true)
class SecondLevel {
  const SecondLevel({required this.count, required this.arr});
  final List<TherdLevel> arr;
  final int count;
}

@ProtoGen(createMappers: true)
class TherdLevel {
  const TherdLevel({required this.count});
  final List<int> count;
}

@ProtoGen(createMappers: true)
enum EnumForArr {
  one,
  two,
  six;
}
