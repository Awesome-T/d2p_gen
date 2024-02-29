import 'package:d2p_annotation/d2p_annotation.dart';

// part 'model222.freezed.dart';
@ProtoGen(createMappers: true)
class Pioijh {
  const Pioijh(this.smthn, this.age);
  final int age;
  final List<Blah>? smthn;
}

// @ProtoGen(createMappers: true)
// enum KindOfAnimalsjbkj { dog2, cat2, motherInlaw2 }

@ProtoGen(createMappers: true)
class Person {
  const Person(this.createdAt, {this.blahs});
  final List<Blah>? blahs;
  final DateTime createdAt;
}

///
///
class SkimThisClass {
  final int a;
  SkimThisClass({
    required this.a,
  });
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
