import 'package:example/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:example/models/model.mp.dart';
import 'package:example/models/model.dart';

void main() {
  group(r'Testing $MapperUser methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperUser.toDTO Output class User should be DTOUser', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = User(
        'dkMA7tadvzokQNmoU8BwlXVyy5cFNR4hJski8LlI1z66iHPCtqzt',
        22,
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
        name: 'S8Z',
        age: 85,
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
            id: 'jaiLdlh07ZtwIYfegUKK5V8y6bTd3YqgPrgKMtfAQZ1Mhk67RqU8hIVO',
            tags: <String>[],
            price: 0.8098884274813184,
            isVerifyed: true,
            settings: <String, double>{
              'vJK1QrtvZXA0tSV9id6JU7mP': 0.8237921814971506,
            },
            count: 13,
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
            id: 'U9a6o2PxkmLm7laQ3Khjmd1B7CSNXqAIgQ41odHtZCHSK38eeV',
            tags: <String>[],
            price: 0.2598403674718608,
            isVerifyed: false,
            settings: jsonEncode(
              <String, double>{
                'YUOOqaj0rKHDTrcWmL1AWFAAKe7xP0d6': 0.8926910371416303,
              },
            ),
            count: 40,
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
        id: 't72G0UQY1Fo',
        tags: <String>[],
        price: 0.7867750652072494,
        isVerifyed: false,
        settings: <String, double>{
          'UWuBrD2jhopXCyDDzPUvYQiEo34FCmTxyje2h': 0.9719705058976326,
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
        id: 'wEgXnGG7cI9dvVQf4IZRBpU',
        tags: <String>[],
        price: 0.12510116597811538,
        isVerifyed: true,
        settings: jsonEncode(
          <String, double>{
            'drVIiWA0LYZV6PhCvigsWZSR94Ir18fxvzqB0Ph5K69DSzQeOVA':
                0.6288045650340387,
          },
        ),
        count: null,
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
