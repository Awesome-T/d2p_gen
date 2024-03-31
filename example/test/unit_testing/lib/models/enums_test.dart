import 'package:exap/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:exap/models/enums.mp.dart';
import 'package:exap/models/enums.dart';

void main() {
  group(r'Testing $MapperCorpus methods', () {
    //
    test('Output enum $Corpus should be $DTOCorpus', () {
      final dto = Corpus.values.first;
      final model = $MapperCorpus.toDTO(dto);
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<DTOCorpus>(),
        reason: 'The output should be of type DTOCorpus',
      );
// Check if the output is not null
      expect(
        model,
        isNotNull,
        reason: 'The output must not be null',
      );
// Check if the output is not an exception
      expect(
        model,
        isNot(isException),
        reason: 'The output must not be an exception',
      );
    });

    //
    test('Output enum $Corpus should be $DTOCorpus', () {
      final model = DTOCorpus.values.first;
      final dto = $MapperCorpus.fromDTO(model);
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<Corpus>(),
        reason: 'The output should be of type Corpus',
      );
// Check if the output is not null
      expect(
        dto,
        isNotNull,
        reason: 'The output must not be null',
      );
// Check if the output is not an exception
      expect(
        dto,
        isNot(isException),
        reason: 'The output must not be an exception',
      );
    });
  });
}
