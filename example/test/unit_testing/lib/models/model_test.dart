import 'package:exap/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:exap/models/model.mp.dart';
import 'package:exap/models/model.dart';

void main() {
  group(r'Testing $MapperUser methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperUser.toDTO Output class User should be DTOUser', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = User(
        'ZymI7ohW2Dq9XeUE',
        49,
      );

      // Act - Call the function that is to be tested
      final dto = $MapperUser.toDTO(model);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<DTOUser>(),
        reason: 'The output should be of type DTOUser',
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
    test(r'$MapperUser.fromDTO Output class User should be User', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final dto = DTOUser(
        name: '8O',
        age: 48,
      );

      // Act - Call the function that is to be tested
      final model = $MapperUser.fromDTO(dto);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<User>(),
        reason: 'The output should be of type User',
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

  group(r'Testing $MapperPerson methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperPerson.toDTO Output class Person should be DTOPerson', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = Person(
        DateTime.now(),
        blahs: <Blah>[
          Blah(
            id: 'PXEqxfg1chZzQHDBPkCMLpZAAiVim7smrtFfC4szvSwnD2hp',
            tags: <String>[],
            price: 0.7464197105902506,
            isVerifyed: true,
            settings: <String, double>{
              'RVyCvCuPim4uOsYJLg8Bh6l8tfyTd9xJRBb5SvWu8a3JFlMVMrQPkT2M':
                  0.3843385175027739,
            },
            count: 59,
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
            id: 'kK2JQAk7rK60IKMi8fDynnvoHEjzu9',
            tags: <String>[],
            price: 0.5698010885835318,
            isVerifyed: true,
            settings: jsonEncode(
              <String, double>{
                'X6OMnbIQCabQzHDL': 0.5205083222874509,
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
        id: 'De9jh3mo',
        tags: <String>[],
        price: 0.5299082573921756,
        isVerifyed: false,
        settings: <String, double>{
          '4z': 0.9999174481004598,
        },
        count: 20,
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
        id: 'R8OcaCsONnTldNxvYuJdO',
        tags: <String>[],
        price: 0.6433179075597572,
        isVerifyed: true,
        settings: jsonEncode(
          <String, double>{
            '0HFl3CjBqe9iBYBywac2bjkQUxgcS9TCr': 0.47140325471728584,
          },
        ),
        count: 6,
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
