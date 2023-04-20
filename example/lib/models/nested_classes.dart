// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:d2p_annotation/dart_to_proto_annotations.dart';

@ProtoGen(
  createMappers: true,
  singleProtofile: false,
)
class FirstLevel {
  //
  const FirstLevel(
    this.dt,
    this.ninew,
    this.pwqwq,
    this.nesyed, {
    required this.mapa, // required this.five,
    required this.one,
    required this.three, // this.six,
    required this.seven,
    required this.nine,
    required this.ten,
    this.zerro,
    //   required this.nesyed,
    this.float,
    this.two,
    // required this.four,
    this.eight,
  });

  final DateTime? dt;
  final bool? eight;
  final List<double>? float;
  final List<SecondLevel> nesyed;
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

  // const ClassForTesting({required this.fieldone});
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
// @ProtoGen(createMappers: true)
// abstract final class FFF {
//   final int aw;
//   const FFF({required this.aw});
// }
