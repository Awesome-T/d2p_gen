import 'dart:convert';
import '../generated/proto/messages.g.pb.dart';
import 'package:exap/models/auto.dart';
import 'package:exap/models/auto.mp.dart';

/// Mapper that converts a DTO [DTOCarModel] object
/// into a Model [CarModel] and back.
abstract class $MapperCarModel {
  /// Converts the model [CarModel]
  /// to the DTO [DTOCarModel].
  static CarModel fromDTO(DTOCarModel model) {
    try {
      return CarModel(
        DateTime.parse(model.produsedAt),
        model.dateOfSale == '' ? null : DateTime.parse(model.dateOfSale),
        model.modelName,
        Automakers(
          model.produser.brands,
          name: model.produser.name,
          country: model.produser.country,
        ),
        List<BodyStyle>.from(
          model.bodyStyles.map<BodyStyle>(
            (e) => $MapperBodyStyle.fromDTO(e),
          ),
        ),
        variants: (jsonDecode(model.variants) as Map).cast<String, int>(),
        avalebleColors: Colors.values.firstWhere((e) =>
            e.name.toLowerCase() == model.avalebleColors.name.toLowerCase()),
        engines: List<Engine>.from(
          model.engines.map<Engine>(
            (e) => $MapperEngine.fromDTO(e),
          ),
        ),
        gear: Gears.values.firstWhere(
            (e) => e.name.toLowerCase() == model.gear.name.toLowerCase()),
      );
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the model [CarModel]
  /// to the DTO [DTOCarModel]
  static DTOCarModel toDTO(CarModel model) {
    try {
      return DTOCarModel(
        produsedAt: model.produsedAt.toIso8601String(),
        dateOfSale: model.dateOfSale?.toIso8601String(),
        modelName: model.modelName,
        produser: DTOAutomakers(
          brands: model.produser.brands,
          name: model.produser.name,
          country: model.produser.country,
        ),
        bodyStyles: List<DTOBodyStyle_Union>.from(
          model.bodyStyles.map<DTOBodyStyle_Union>(
            (e) => $MapperBodyStyle.toDTO(e),
          ),
        ),
        variants: jsonEncode(model.variants),
        avalebleColors: DTOColors.values.firstWhere((e) =>
            model.avalebleColors.name.toUpperCase() == e.name.toUpperCase()),
        engines: List<DTOEngine_Union>.from(
          model.engines.map<DTOEngine_Union>(
            (e) => $MapperEngine.toDTO(e),
          ),
        ),
        gear: DTOGears.values.firstWhere(
            (e) => model.gear.name.toUpperCase() == e.name.toUpperCase()),
      );
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }
}

/// Mapper that converts a DTO [DTOAutomakers] object
/// into a Model [Automakers] and back.
abstract class $MapperAutomakers {
  /// Converts the model [Automakers]
  /// to the DTO [DTOAutomakers].
  static Automakers fromDTO(DTOAutomakers model) {
    try {
      return Automakers(
        model.brands,
        name: model.name,
        country: model.country,
      );
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the model [Automakers]
  /// to the DTO [DTOAutomakers]
  static DTOAutomakers toDTO(Automakers model) {
    try {
      return DTOAutomakers(
        brands: model.brands,
        name: model.name,
        country: model.country,
      );
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }
}

/// Mapper that converts a DTO [DTOBrand] object
/// into a Model [Brand] and back.
abstract class $MapperBrand {
  /// Converts the model [Brand]
  /// to the DTO [DTOBrand].
  static Brand fromDTO(DTOBrand model) {
    try {
      return Brand(
        name: model.name,
        models: (model.models.isNotEmpty)
            ? List<CarModel>.from(
                model.models.map<CarModel>(
                  (model) => CarModel(
                    DateTime.parse(model.produsedAt),
                    model.dateOfSale == ''
                        ? null
                        : DateTime.parse(model.dateOfSale),
                    model.modelName,
                    Automakers(
                      model.produser.brands,
                      name: model.produser.name,
                      country: model.produser.country,
                    ),
                    List<BodyStyle>.from(
                      model.bodyStyles.map<BodyStyle>(
                        (e) => $MapperBodyStyle.fromDTO(e),
                      ),
                    ),
                    variants:
                        (jsonDecode(model.variants) as Map).cast<String, int>(),
                    avalebleColors: Colors.values.firstWhere((e) =>
                        e.name.toLowerCase() ==
                        model.avalebleColors.name.toLowerCase()),
                    engines: List<Engine>.from(
                      model.engines.map<Engine>(
                        (e) => $MapperEngine.fromDTO(e),
                      ),
                    ),
                    gear: Gears.values.firstWhere((e) =>
                        e.name.toLowerCase() == model.gear.name.toLowerCase()),
                  ),
                ),
              )
            : [],
      );
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the model [Brand]
  /// to the DTO [DTOBrand]
  static DTOBrand toDTO(Brand model) {
    try {
      return DTOBrand(
        name: model.name,
        models: (model.models.isNotEmpty)
            ? List<DTOCarModel>.from(
                model.models.map<DTOCarModel>(
                  (model) => DTOCarModel(
                    produsedAt: model.produsedAt.toIso8601String(),
                    dateOfSale: model.dateOfSale?.toIso8601String(),
                    modelName: model.modelName,
                    produser: DTOAutomakers(
                      brands: model.produser.brands,
                      name: model.produser.name,
                      country: model.produser.country,
                    ),
                    bodyStyles: List<DTOBodyStyle_Union>.from(
                      model.bodyStyles.map<DTOBodyStyle_Union>(
                        (e) => $MapperBodyStyle.toDTO(e),
                      ),
                    ),
                    variants: jsonEncode(model.variants),
                    avalebleColors: DTOColors.values.firstWhere((e) =>
                        model.avalebleColors.name.toUpperCase() ==
                        e.name.toUpperCase()),
                    engines: List<DTOEngine_Union>.from(
                      model.engines.map<DTOEngine_Union>(
                        (e) => $MapperEngine.toDTO(e),
                      ),
                    ),
                    gear: DTOGears.values.firstWhere((e) =>
                        model.gear.name.toUpperCase() == e.name.toUpperCase()),
                  ),
                ),
              )
            : [],
      );
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }
}

/// Mapper that converts a DTO [DTOBodyStyle_Union] object
/// into a Model [BodyStyle] and back.
abstract class $MapperBodyStyle {
  /// Converts the model [BodyStyle]
  /// to the DTO [DTOBodyStyle_Union].
  static BodyStyle fromDTO(DTOBodyStyle_Union model) {
    try {
      if (model.hasSuv()) {
        return BodyStyle.sUv(
          model.suv.is4WD,
        );
      }
      if (model.hasCoupe()) {
        return BodyStyle.coupe(
          model.coupe.isFoldingRoof,
        );
      }
      if (model.hasPickup()) {
        return BodyStyle.pickup(
          cargoSpace: model.pickup.cargoSpace,
        );
      } else {
        throw FormatException('No valid DTO $model');
      }
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the DTO [DTOBodyStyle_Union]
  /// to the model [BodyStyle]
  static DTOBodyStyle_Union toDTO(BodyStyle model) {
    try {
      if (model is SuV) {
        return DTOBodyStyle_Union(
          suv: DTOSuV(
            is4WD: model.is4WD,
          ),
        );
      }
      if (model is Coupe) {
        return DTOBodyStyle_Union(
          coupe: DTOCoupe(
            isFoldingRoof: model.isFoldingRoof,
          ),
        );
      }
      if (model is Pickup) {
        return DTOBodyStyle_Union(
          pickup: DTOPickup(
            cargoSpace: model.cargoSpace,
          ),
        );
      } else {
        throw FormatException('No valid DTO $model');
      }
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }
}

/// Mapper that converts a DTO [DTOEngine_Union] object
/// into a Model [Engine] and back.
abstract class $MapperEngine {
  /// Converts the model [Engine]
  /// to the DTO [DTOEngine_Union].
  static Engine fromDTO(DTOEngine_Union model) {
    try {
      if (model.hasGasolineengine()) {
        return GasolineEngine(
          hp: model.gasolineengine.hp,
          fuelConsumption: model.gasolineengine.fuelConsumption,
        );
      }
      if (model.hasDiselengine()) {
        return DiselEngine(
          hp: model.diselengine.hp,
          fuelConsumption: model.diselengine.fuelConsumption,
        );
      }
      if (model.hasElectricengine()) {
        return ElectricEngine(
          model.electricengine.hp,
        );
      } else {
        throw FormatException('No valid DTO $model');
      }
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the DTO [DTOEngine_Union]
  /// to the model [Engine]
  static DTOEngine_Union toDTO(Engine model) {
    try {
      if (model is GasolineEngine) {
        return DTOEngine_Union(
          gasolineengine: DTOGasolineEngine(
            hp: model.hp,
            fuelConsumption: model.fuelConsumption,
          ),
        );
      }
      if (model is DiselEngine) {
        return DTOEngine_Union(
          diselengine: DTODiselEngine(
            hp: model.hp,
            fuelConsumption: model.fuelConsumption,
          ),
        );
      }
      if (model is ElectricEngine) {
        return DTOEngine_Union(
          electricengine: DTOElectricEngine(
            hp: model.hp,
          ),
        );
      } else {
        throw FormatException('No valid DTO $model');
      }
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }
}

///
/// Mapper that converts a DTO [$MapperGears] object into a enum [Gears] and back.
///
abstract class $MapperGears {
  ///
  /// Mapper that converts a DTO [$MapperGears] object into an [Enum] [Gears].
  ///
  static DTOGears toDTO(Gears enumField) {
    try {
      return DTOGears.values.firstWhere(
          (e) => e.name.toUpperCase() == enumField.name.toUpperCase());
    } on FormatException catch (e, trace) {
      throw FormatException('''Error
${e.source}
${e.message}
$trace''');
    }
  }

  ///
  /// Mapper that converts a DTO [$MapperGears] object into an [Enum] [Gears].
  ///
  static Gears fromDTO(DTOGears enumField) {
    try {
      return Gears.values.firstWhere(
          (e) => e.name.toUpperCase() == enumField.name.toUpperCase());
    } on FormatException catch (e, trace) {
      throw FormatException('''Error
${e.source}
${e.message}
$trace''');
    }
  }
}

///
/// Mapper that converts a DTO [$MapperColors] object into a enum [Colors] and back.
///
abstract class $MapperColors {
  ///
  /// Mapper that converts a DTO [$MapperColors] object into an [Enum] [Colors].
  ///
  static DTOColors toDTO(Colors enumField) {
    try {
      return DTOColors.values.firstWhere(
          (e) => e.name.toUpperCase() == enumField.name.toUpperCase());
    } on FormatException catch (e, trace) {
      throw FormatException('''Error
${e.source}
${e.message}
$trace''');
    }
  }

  ///
  /// Mapper that converts a DTO [$MapperColors] object into an [Enum] [Colors].
  ///
  static Colors fromDTO(DTOColors enumField) {
    try {
      return Colors.values.firstWhere(
          (e) => e.name.toUpperCase() == enumField.name.toUpperCase());
    } on FormatException catch (e, trace) {
      throw FormatException('''Error
${e.source}
${e.message}
$trace''');
    }
  }
}
