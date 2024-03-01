import 'dart:convert';
import 'package:exap/src/generated/messages.pb.dart';
import 'package:exap/models/model.dart';

/// Mapper that converts a DTO [DTOPioijh] object
/// into a Model [Pioijh] and back.
abstract class $MapperPioijh {
  /// Converts the model [Pioijh]
  /// to the DTO [DTOPioijh].
  static Pioijh fromDTO(DTOPioijh model) {
    try {
      return Pioijh(
        (model.smthn.isNotEmpty ?? false)
            ? List<Blah>.from(
                model.smthn!.map<Blah>(
                  (model) => Blah(
                    id: model.id,
                    tags: model.tags,
                    price: model.price,
                    isVerifyed: model.isVerifyed,
                    settings: jsonDecode(model.settings) as Map<String, double>,
                    count: model.count,
                  ),
                ),
              )
            : [],
        model.age,
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

  /// Converts the model [Pioijh]
  /// to the DTO [DTOPioijh]
  static DTOPioijh toDTO(Pioijh model) {
    try {
      return DTOPioijh(
        smthn: (model.smthn.isNotEmpty ?? false)
            ? List<DTOBlah>.from(
                model.smthn!.map<DTOBlah>(
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
        age: model.age,
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

/// Mapper that converts a DTO [DTOPerson] object
/// into a Model [Person] and back.
abstract class $MapperPerson {
  /// Converts the model [Person]
  /// to the DTO [DTOPerson].
  static Person fromDTO(DTOPerson model) {
    try {
      return Person(
        DateTime.parse(model.createdAt),
        blahs: (model.blahs?.isNotEmpty ?? false)
            ? List<Blah>.from(
                model.blahs!.map<Blah>(
                  (model) => Blah(
                    id: model.id,
                    tags: model.tags,
                    price: model.price,
                    isVerifyed: model.isVerifyed,
                    settings: jsonDecode(model.settings) as Map<String, double>,
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
        createdAt: model.createdAt?.toIso8601String(),
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
        settings: jsonDecode(model.settings) as Map<String, double>,
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
