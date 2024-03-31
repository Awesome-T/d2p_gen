import 'dart:convert';
import '../generated/proto/messages.g.pb.dart';
import 'package:exap/models/model.dart';
import 'package:exap/models/model.mp.dart';

/// Mapper that converts a DTO [DTOPerson] object
/// into a Model [Person] and back.
abstract class $MapperPerson {
  /// Converts the model [Person]
  /// to the DTO [DTOPerson].
  static Person fromDTO(DTOPerson model) {
    try {
      return Person(
        DateTime.parse(model.createdAt),
        blahs: (model.blahs.isNotEmpty)
            ? List<Blah>.from(
                model.blahs.map<Blah>(
                  (model) => Blah(
                    id: model.id,
                    tags: model.tags,
                    price: model.price,
                    isVerifyed: model.isVerifyed,
                    settings: (jsonDecode(model.settings) as Map)
                        .cast<String, double>(),
                    count: model.count,
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

  /// Converts the model [Person]
  /// to the DTO [DTOPerson]
  static DTOPerson toDTO(Person model) {
    try {
      return DTOPerson(
        createdAt: model.createdAt.toIso8601String(),
        blahs: (model.blahs?.isNotEmpty ?? false)
            ? List<DTOBlah>.from(
                model.blahs!.map<DTOBlah>(
                  (model) => DTOBlah(
                    id: model.id,
                    tags: model.tags,
                    price: model.price,
                    isVerifyed: model.isVerifyed,
                    settings: jsonEncode(model.settings),
                    count: model.count,
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

/// Mapper that converts a DTO [DTOBlah] object
/// into a Model [Blah] and back.
abstract class $MapperBlah {
  /// Converts the model [Blah]
  /// to the DTO [DTOBlah].
  static Blah fromDTO(DTOBlah model) {
    try {
      return Blah(
        id: model.id,
        tags: model.tags,
        price: model.price,
        isVerifyed: model.isVerifyed,
        settings: (jsonDecode(model.settings) as Map).cast<String, double>(),
        count: model.count,
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

  /// Converts the model [Blah]
  /// to the DTO [DTOBlah]
  static DTOBlah toDTO(Blah model) {
    try {
      return DTOBlah(
        id: model.id,
        tags: model.tags,
        price: model.price,
        isVerifyed: model.isVerifyed,
        settings: jsonEncode(model.settings),
        count: model.count,
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
