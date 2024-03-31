// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:d2p_annotation/d2p_annotation.dart';

@ProtoGen(createMappers: true)
class CarModel {
  final Map<String, int> variants;
  final Colors avalebleColors;
  final List<Engine> engines;
  final List<BodyStyle> bodyStyles;
  final DateTime produsedAt;
  final DateTime? dateOfSale;
  final String modelName;
  final Gears gear;
  final Automakers produser;
  const CarModel(this.produsedAt, this.dateOfSale, this.modelName,
      this.produser, this.bodyStyles,
      {required this.variants,
      required this.avalebleColors,
      required this.engines,
      required this.gear});

  @override
  String toString() {
    return 'CarModel(variants: $variants, avalebleColors: $avalebleColors, engines: $engines, bodyStyles: $bodyStyles, produsedAt: $produsedAt, dateOfSale: $dateOfSale, modelName: $modelName, gear: $gear, produser: $produser)';
  }

  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return collectionEquals(other.variants, variants) &&
        other.avalebleColors == avalebleColors &&
        collectionEquals(other.engines, engines) &&
        collectionEquals(other.bodyStyles, bodyStyles) &&
        other.produsedAt == produsedAt &&
        other.dateOfSale == dateOfSale &&
        other.modelName == modelName &&
        other.gear == gear &&
        other.produser == produser;
  }

  @override
  int get hashCode {
    return variants.hashCode ^
        avalebleColors.hashCode ^
        engines.hashCode ^
        bodyStyles.hashCode ^
        produsedAt.hashCode ^
        dateOfSale.hashCode ^
        modelName.hashCode ^
        gear.hashCode ^
        produser.hashCode;
  }
}

@ProtoGen(createMappers: true)
enum Gears {
  namual,
  auto;
}

@ProtoGen(createMappers: true)
enum Colors {
  red,
  blue,
  green,
  wthite,
  black;
}

@ProtoGen(createMappers: true)
class Automakers {
  final String name;
  final String country;
  final List<String> brands;
  Automakers(
    this.brands, {
    required this.name,
    required this.country,
  });
}

@ProtoGen(createMappers: true)
class Brand {
  final String name;
  final List<CarModel> models;
  Brand({required this.name, required this.models});
}

@ProtoGen(createMappers: true)
abstract class BodyStyle {
  const BodyStyle();
  // should be ignored
  const factory BodyStyle.sedan() = Sedan;
  const factory BodyStyle.sUv(final bool is4WD) = SuV;
  const factory BodyStyle.coupe(final bool isFoldingRoof) = Coupe;
  const factory BodyStyle.pickup({required double cargoSpace}) = Pickup;
  // should be ignored
  const factory BodyStyle.mpv() = _MultiPV;
}

class _MultiPV extends BodyStyle {
  const _MultiPV();
}

class Sedan extends BodyStyle {
  const Sedan();
}

class SuV extends BodyStyle {
  const SuV(this.is4WD);
  final bool is4WD;
}

class Coupe extends BodyStyle {
  const Coupe(this.isFoldingRoof);
  final bool isFoldingRoof;
}

class Pickup extends BodyStyle {
  const Pickup({required this.cargoSpace});
  final double cargoSpace;
}

///
///
@ProtoGen(createMappers: true)
sealed class Engine {}

@ProtoGen(createMappers: true)
final class GasolineEngine extends Engine {
  final int hp;
  final double fuelConsumption;
  GasolineEngine({required this.hp, required this.fuelConsumption});
}

// DiselEngine GasolineEngine ElectricEngine
@ProtoGen(createMappers: true)
final class DiselEngine extends Engine {
  final int hp;
  final double fuelConsumption;

  DiselEngine({required this.hp, required this.fuelConsumption});
}

@ProtoGen(createMappers: true)
final class ElectricEngine extends Engine {
  final int hp;
  ElectricEngine(this.hp);
}
