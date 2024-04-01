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
        'ipWPsjO592cgzERu0tziJsBJtc1el8Dnbp',
        75,
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
        name: 'dF9fgCDEMFizC5ZjgrJuBhSdRN',
        age: 95,
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
            id: 'is48jL',
            tags: <String>[],
            price: 0.78153915918976,
            isVerifyed: false,
            settings: <String, double>{
              'phhyy7TDp8CFPrRvqNIAdcyYyygDnoVDj2mzmKjtzndHUhkYNoWY':
                  0.2147076464481532,
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
            id: 'DR2B0',
            tags: <String>[],
            price: 0.9306579076774815,
            isVerifyed: false,
            settings: jsonEncode(
              <String, double>{
                'L7bRTVxMIP1LLOsbSAeVcM1VtxiyrTYFx': 0.2534929421071862,
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
        id: 'G8kNZwaEBaD03w9hwHZMO14GGM6n6pCutvZEArTeJQS',
        tags: <String>[],
        price: 0.9016582581122198,
        isVerifyed: false,
        settings: <String, double>{
          'rvbLoCkWOvvT9C6pnZzp9V': 0.8460725180322456,
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
        id: 'THHANzdJPIVXLiB9Tn',
        tags: <String>[],
        price: 0.5795394900467863,
        isVerifyed: false,
        settings: jsonEncode(
          <String, double>{
            'k': 0.0901577856636957,
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
