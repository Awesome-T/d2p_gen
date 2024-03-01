import 'dart:convert';
import 'package:exap/src/generated/messages.pb.dart';
import 'package:exap/models/fr_union.dart';

/// Mapper that converts a DTO [DTOFreezedCl_Union] object
/// into a Model [FreezedCl] and back.
abstract class $MapperFreezedCl {
  /// Converts the model [FreezedCl]
  /// to the DTO [DTOFreezedCl_Union].
  static FreezedCl fromDTO(DTOFreezedCl_Union model) {
    try {
      if (model.hasError()) {
        return FreezedCl.error(
          model.error.message,
        );
      }
      if (model.hasComplex()) {
        return FreezedCl.complex(
          model.complex.a,
          model.complex.b,
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

  /// Converts the DTO [DTOFreezedCl_Union]
  /// to the model [FreezedCl]
  static DTOFreezedCl_Union toDto(FreezedCl model) {
    try {
      if (model is ErrorDetails) {
        return DTOFreezedCl_Union(
          error: DTOErrorDetails(
            message: model.message,
          ),
        );
      }
      if (model is Complex) {
        return DTOFreezedCl_Union(
          complex: DTOComplex(
            a: model.a,
            b: model.b,
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
