import 'dart:convert';
import 'package:exap/src/generated/messages.pb.dart';
import 'package:exap/models/sealeds.dart';

/// Mapper that converts a DTO [DTOAnimal_Union] object
/// into a Model [Animal] and back.
abstract class $MapperAnimal {
  /// Converts the model [Animal]
  /// to the DTO [DTOAnimal_Union].
  static Animal fromDTO(DTOAnimal_Union model) {
    try {
      if (model.hasCow()) {
        return Cow(
          weight: model.cow.weight,
          nullableString: model.cow.nullableString,
          nullableDateTime: DateTime.tryParse(model.cow.nullableDateTime),
        );
      }
      if (model.hasSheep()) {
        return Sheep(
          one: model.sheep.one,
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
  static DTOAnimal_Union toDto(Animal model) {
    try {
      if (model is Cow) {
        return DTOAnimal_Union(
          cow: DTOCow(
            weight: model.weight,
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
