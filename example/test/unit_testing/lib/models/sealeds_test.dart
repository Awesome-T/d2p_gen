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
          weight: 0.6551467451300933,
          height: null,
          nullableString: 't9qE3qYikmTjIOR',
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
          bolean: false,
          weight: 0.616873723122116,
          height: null,
          nullableString: 'qxAlhT96pCyfK21j',
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
          one: 'tnijf',
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
          one: 'nLrDZjBglre78b3vgO4kfs9zeRS4f',
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
          se: 0.5237180279593211,
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
          se: 0.046716390127040985,
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
