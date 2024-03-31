import 'package:d2p_annotation/d2p_annotation.dart';

@ProtoGen(createMappers: true)
class Person {
  const Person(this.createdAt, {this.blahs});
  final List<Blah>? blahs;
  final DateTime createdAt;
}

@ProtoGen(createMappers: true)
class Blah {
  const Blah({
    required this.id,
    required this.tags,
    required this.price,
    required this.isVerifyed,
    required this.settings,
    this.count,
  });
  final int? count;
  final String id;
  final List<String> tags;
  final double price;
  final bool isVerifyed;
  final Map<String, double> settings;
}
