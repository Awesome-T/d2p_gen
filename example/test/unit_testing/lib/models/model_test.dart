import 'package:exap/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:exap/models/model.mp.dart';
import 'package:exap/models/model.dart';

void main() {
  group(r'Testing $MapperPerson methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperPerson.toDTO Output class Person should be DTOPerson', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = Person(
        DateTime.now(),
        blahs: <Blah>[
          Blah(
            id: 'cR0wAQlvFk5nSXd10rfmrMiqtTNs4',
            tags: <String>[],
            price: 0.8745282213717436,
            isVerifyed: true,
            settings: <String, double>{
              '5U6dl3g7': 0.3523577521781627,
            },
            count: 34,
          )
        ],
      );

      // Act - Call the function that is to be tested
      final dto = $MapperPerson.toDTO(model);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<DTOPerson>(),
        reason: 'The output should be of type DTOPerson',
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

// Test the fromDTO method (which returns a dart data class or enum)
    test(r'$MapperPerson.fromDTO Output class Person should be Person', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final dto = DTOPerson(
        createdAt: DateTime.now().toIso8601String(),
        blahs: <DTOBlah>[
          DTOBlah(
            id: '5mM7ENYrAlP2NsmUKWwkQH2PyUP1DR3ezGFuGADpDSLkkTmIZv3x4Sz8pxCVk',
            tags: <String>[],
            price: 0.3863781420541921,
            isVerifyed: true,
            settings: jsonEncode(
              <String, double>{
                'i2bUMu88mtLyB3VsVJsDpllqDjP': 0.526994686125402,
              },
            ),
            count: null,
          )
        ],
      );

      // Act - Call the function that is to be tested
      final model = $MapperPerson.fromDTO(dto);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<Person>(),
        reason: 'The output should be of type Person',
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
  });

  group(r'Testing $MapperBlah methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperBlah.toDTO Output class Blah should be DTOBlah', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = Blah(
        id: 'GqtuJpzpgZuX0zN',
        tags: <String>[],
        price: 0.8502695282298374,
        isVerifyed: false,
        settings: <String, double>{
          'CsnXaEI2budHQIDyWkOS6E0iDfcrB': 0.3507870536917611,
        },
        count: null,
      );

      // Act - Call the function that is to be tested
      final dto = $MapperBlah.toDTO(model);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<DTOBlah>(),
        reason: 'The output should be of type DTOBlah',
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

// Test the fromDTO method (which returns a dart data class or enum)
    test(r'$MapperBlah.fromDTO Output class Blah should be Blah', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final dto = DTOBlah(
        id: 'LUCtoYPEKbMuMLCsQFzoxjQjdloxgFuRd',
        tags: <String>[],
        price: 0.9390961683043042,
        isVerifyed: true,
        settings: jsonEncode(
          <String, double>{
            'vO6LXYY3xeK1FRRR2IaCc3z5RKDRnElAYzv8iqp7dRTqLoqLXRvB7FEY0xms':
                0.5529742336786506,
          },
        ),
        count: 4,
      );

      // Act - Call the function that is to be tested
      final model = $MapperBlah.fromDTO(dto);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<Blah>(),
        reason: 'The output should be of type Blah',
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
  });
}
