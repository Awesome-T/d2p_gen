import 'package:exap/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:exap/models/abstract_factories.mp.dart';
import 'package:exap/models/abstract_factories.dart';

void main() {
  group(r'Testing $MapperAbsFactories', () {
    group(r'Testing $MapperAbsFactories methods for AbsSecond', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperAbsFactories.toDTO Output class AbsSecond should be DTOAbsFactories_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = AbsSecond(
          '53y8QA8',
          48,
          false,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperAbsFactories.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOAbsFactories_Union>(),
          reason: 'The output should be of type DTOAbsFactories_Union',
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
      test(
          r'$MapperAbsFactories.fromDTO Output class AbsSecond should be AbsSecond',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOAbsFactories_Union(
            first: DTOAbsSecond(
          a: 'nAyEbfVrrv8C1ArBVzpF8SKqC9obm6MwDaUw9XiQHMRVBjQBn6',
          b: 98,
          c: false,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperAbsFactories.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<AbsSecond>(),
          reason: 'The output should be of type AbsSecond',
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

    group(r'Testing $MapperAbsFactories methods for AbsTherd', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperAbsFactories.toDTO Output class AbsTherd should be DTOAbsFactories_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = AbsTherd(
          '7hltx7NWC8M9HdKYfYIDDlbkxPX9Kxnl9FOktYa1Cy3iW02cYaqiBaRy01',
        );

        // Act - Call the function that is to be tested
        final dto = $MapperAbsFactories.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOAbsFactories_Union>(),
          reason: 'The output should be of type DTOAbsFactories_Union',
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
      test(
          r'$MapperAbsFactories.fromDTO Output class AbsTherd should be AbsTherd',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOAbsFactories_Union(
            second: DTOAbsTherd(
          d: '5kJCBUBbxkieGriTGVXTGHwcfZZiNRSWphErN1MvXYW',
        ));

        // Act - Call the function that is to be tested
        final model = $MapperAbsFactories.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<AbsTherd>(),
          reason: 'The output should be of type AbsTherd',
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
