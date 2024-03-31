import 'package:d2p_annotation/d2p_annotation.dart';

@ProtoGen()
sealed class Animal {
  const Animal();
}

@ProtoGen(createMappers: true)
class Cow extends Animal {
  final int? height;
  final String? nullableString;
  final DateTime? nullableDateTime;
  final List<DateTime>? dates;
  final bool bolean;
  final double weight;
  const Cow(
    this.dates,
    this.bolean, {
    required this.weight,
    this.height,
    this.nullableString,
    this.nullableDateTime,
  });
}

@ProtoGen(createMappers: true)
class Sheep extends Animal {
  final String one;
  const Sheep({required this.one});
}

@ProtoGen(createMappers: true)
class Pig extends Animal {
  final double se;
  const Pig({required this.se});
}
