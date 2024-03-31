import 'dart:convert';
import '../generated/proto/messages.g.pb.dart';
import 'package:exap/models/enums.dart';

///
/// Mapper that converts a DTO [$MapperCorpus] object into a enum [Corpus] and back.
///
abstract class $MapperCorpus {
  ///
  /// Mapper that converts a DTO [$MapperCorpus] object into an [Enum] [Corpus].
  ///
  static DTOCorpus toDTO(Corpus enumField) {
    try {
      return DTOCorpus.values.firstWhere(
          (e) => e.name.toUpperCase() == enumField.name.toUpperCase());
    } on FormatException catch (e, trace) {
      throw FormatException('''Error
${e.source}
${e.message}
$trace''');
    }
  }

  ///
  /// Mapper that converts a DTO [$MapperCorpus] object into an [Enum] [Corpus].
  ///
  static Corpus fromDTO(DTOCorpus enumField) {
    try {
      return Corpus.values.firstWhere(
          (e) => e.name.toUpperCase() == enumField.name.toUpperCase());
    } on FormatException catch (e, trace) {
      throw FormatException('''Error
${e.source}
${e.message}
$trace''');
    }
  }
}
