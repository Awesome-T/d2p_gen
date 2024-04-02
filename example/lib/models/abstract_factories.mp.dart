import 'dart:convert';
import '../generated/proto/messages.g.pb.dart';
import 'package:example/models/abstract_factories.dart';
import 'package:example/models/abstract_factories.mp.dart';

/// Mapper that converts a DTO [DTOAbsFactories_Union] object
/// into a Model [AbsFactories] and back.
abstract class $MapperAbsFactories {
  /// Converts the model [AbsFactories]
  /// to the DTO [DTOAbsFactories_Union].
  static AbsFactories fromDTO(DTOAbsFactories_Union model) {
    try {
      if (model.hasFirst()) {
        return AbsFactories.first(
          model.first.a,
          model.first.b,
          model.first.c,
        );
      }
      if (model.hasSecond()) {
        return AbsFactories.second(
          model.second.d,
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

  /// Converts the DTO [DTOAbsFactories_Union]
  /// to the model [AbsFactories]
  static DTOAbsFactories_Union toDTO(AbsFactories model) {
    try {
      if (model is AbsSecond) {
        return DTOAbsFactories_Union(
          first: DTOAbsSecond(
            a: model.a,
            b: model.b,
            c: model.c,
          ),
        );
      }
      if (model is AbsTherd) {
        return DTOAbsFactories_Union(
          second: DTOAbsTherd(
            d: model.d,
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
