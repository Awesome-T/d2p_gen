import 'dart:convert';
import '../generated/proto/messages.g.pb.dart';
import 'package:example/models/sealeds.dart';
import 'package:example/models/sealeds.mp.dart';

/// Mapper that converts a DTO [DTOAnimal_Union] object
/// into a Model [Animal] and back.
abstract class $MapperAnimal {
  /// Converts the model [Animal]
  /// to the DTO [DTOAnimal_Union].
  static Animal fromDTO(DTOAnimal_Union model) {
    try {
      if (model.hasCow()) {
        return Cow(
          (model.cow.dates.isNotEmpty)
              ? List<DateTime>.from(
                  model.cow.dates.map(
                    (e) => e == '' ? null : DateTime.parse(e),
                  ),
                )
              : [],
          model.cow.bolean,
          weight: model.cow.weight,
          height: model.cow.height,
          nullableString: model.cow.nullableString,
          nullableDateTime: model.cow.nullableDateTime == ''
              ? null
              : DateTime.parse(model.cow.nullableDateTime),
        );
      }
      if (model.hasSheep()) {
        return Sheep(
          one: model.sheep.one,
        );
      }
      if (model.hasPig()) {
        return Pig(
          se: model.pig.se,
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

  /// Converts the DTO [DTOAnimal_Union]
  /// to the model [Animal]
  static DTOAnimal_Union toDTO(Animal model) {
    try {
      if (model is Cow) {
        return DTOAnimal_Union(
          cow: DTOCow(
            dates: (model.dates?.isNotEmpty ?? false)
                ? List<String>.from(
                    model.dates!.map(
                      (e) => e.toIso8601String(),
                    ),
                  )
                : [],
            bolean: model.bolean,
            weight: model.weight,
            height: model.height,
            nullableString: model.nullableString,
            nullableDateTime: model.nullableDateTime?.toIso8601String(),
          ),
        );
      }
      if (model is Sheep) {
        return DTOAnimal_Union(
          sheep: DTOSheep(
            one: model.one,
          ),
        );
      }
      if (model is Pig) {
        return DTOAnimal_Union(
          pig: DTOPig(
            se: model.se,
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
