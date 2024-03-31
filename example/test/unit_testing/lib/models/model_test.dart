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
            id: 'KHfj19We1X5HsclaeOJjy5YEDD22F4fJPRoQGryFLtk',
            tags: <String>[],
            price: 0.028976342385629406,
            isVerifyed: true,
            settings: <String, double>{
              'Sz4eIXaoh3zqo7GHc3RNO5nM0JT1z7L8AE5QPRwwXzUopRVf84uB':
                  0.32815123210632446,
            },
            count: null,
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
            id: 'id8MC',
            tags: <String>[],
            price: 0.6338297758796516,
            isVerifyed: true,
            settings: jsonEncode(
              <String, double>{
                'CEVsPr1Ns9ndrQlcrFFThkDb3kjtxe0vxWjfTfQYzLDEFw5l686T':
                    0.6860277832337819,
              },
            ),
            count: 38,
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
        id: 'aIm420gx9gLXjiVIptFWD',
        tags: <String>[],
        price: 0.8239957643821877,
        isVerifyed: false,
        settings: <String, double>{
          'YwC3NfQua0AP5LQTYp4yu1S18P8WdkPPs4Ezt3qqzmovMXcZ':
              0.40539820938369464,
        },
        count: 84,
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
        id: 'ORCP2Iyg0MikWKF',
        tags: <String>[],
        price: 0.27842247975895773,
        isVerifyed: true,
        settings: jsonEncode(
          <String, double>{
            'XsRbmhn6Op9xu6mHyZgzg4Jsi2WuFA8nQh4jvN8xBi': 0.05495463100972253,
          },
        ),
        count: 58,
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
