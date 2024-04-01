import 'package:exap/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:exap/models/sealeds.mp.dart';
import 'package:exap/models/sealeds.dart';

void main() {
  group(r'Testing $MapperAnimal', () {
    group(r'Testing $MapperAnimal methods for Cow', () {
// Test the toDTO method (which returns a DTO class)
      test(r'$MapperAnimal.toDTO Output class Cow should be DTOAnimal_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = Cow(
          <DateTime>[],
          false,
          weight: 0.4064829074036247,
          height: null,
          nullableString: '929yvZT1t8Tl5a6tJbfRz4E',
          nullableDateTime: DateTime.now(),
        );

        // Act - Call the function that is to be tested
        final dto = $MapperAnimal.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOAnimal_Union>(),
          reason: 'The output should be of type DTOAnimal_Union',
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
      test(r'$MapperAnimal.fromDTO Output class Cow should be Cow', () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOAnimal_Union(
            cow: DTOCow(
          dates: <String>[],
          bolean: true,
          weight: 0.5368114541184378,
          height: null,
          nullableString:
              'G4XejCVWEPP5G0yb9Gn31wLx1m1cPjpGQy2371LSKAr5Jtxj0YwVoPg2n',
          nullableDateTime: DateTime.now().toIso8601String(),
        ));

        // Act - Call the function that is to be tested
        final model = $MapperAnimal.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<Cow>(),
          reason: 'The output should be of type Cow',
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

    group(r'Testing $MapperAnimal methods for Sheep', () {
// Test the toDTO method (which returns a DTO class)
      test(r'$MapperAnimal.toDTO Output class Sheep should be DTOAnimal_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = Sheep(
          one: 'B9N4LmPpD92yzmCzQbfsOhvZZfEh7et6UT6QfReC9xW',
        );

        // Act - Call the function that is to be tested
        final dto = $MapperAnimal.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOAnimal_Union>(),
          reason: 'The output should be of type DTOAnimal_Union',
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
      test(r'$MapperAnimal.fromDTO Output class Sheep should be Sheep', () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOAnimal_Union(
            sheep: DTOSheep(
          one: 'fsXMkyFPb',
        ));

        // Act - Call the function that is to be tested
        final model = $MapperAnimal.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<Sheep>(),
          reason: 'The output should be of type Sheep',
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

    group(r'Testing $MapperAnimal methods for Pig', () {
// Test the toDTO method (which returns a DTO class)
      test(r'$MapperAnimal.toDTO Output class Pig should be DTOAnimal_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = Pig(
          se: 0.856703070943234,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperAnimal.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOAnimal_Union>(),
          reason: 'The output should be of type DTOAnimal_Union',
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
      test(r'$MapperAnimal.fromDTO Output class Pig should be Pig', () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOAnimal_Union(
            pig: DTOPig(
          se: 0.18260579304082825,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperAnimal.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<Pig>(),
          reason: 'The output should be of type Pig',
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
  });
}
