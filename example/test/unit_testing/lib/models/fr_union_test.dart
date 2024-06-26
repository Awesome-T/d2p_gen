import 'package:example/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:example/models/fr_union.mp.dart';
import 'package:example/models/fr_union.dart';

void main() {
  group(r'Testing $MapperFreezedCl', () {
    group(r'Testing $MapperFreezedCl methods for ErrorDetails', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperFreezedCl.toDTO Output class ErrorDetails should be DTOFreezedCl_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = ErrorDetails(
          null,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperFreezedCl.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOFreezedCl_Union>(),
          reason: 'The output should be of type DTOFreezedCl_Union',
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
          r'$MapperFreezedCl.fromDTO Output class ErrorDetails should be ErrorDetails',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOFreezedCl_Union(
            error: DTOErrorDetails(
          message: null,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperFreezedCl.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<ErrorDetails>(),
          reason: 'The output should be of type ErrorDetails',
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

    group(r'Testing $MapperFreezedCl methods for Complex', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperFreezedCl.toDTO Output class Complex should be DTOFreezedCl_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = Complex(
          80,
          'FdS3SAZLaqgEeHcWcmcst71qfA7eEsc4rOKLPhgf',
        );

        // Act - Call the function that is to be tested
        final dto = $MapperFreezedCl.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOFreezedCl_Union>(),
          reason: 'The output should be of type DTOFreezedCl_Union',
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
      test(r'$MapperFreezedCl.fromDTO Output class Complex should be Complex',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOFreezedCl_Union(
            complex: DTOComplex(
          a: 89,
          b: '7OkYsk5CmKK7DyEOJDfieEfyvdHCKGpJmM8y5SgCAZnhmhSc62U',
        ));

        // Act - Call the function that is to be tested
        final model = $MapperFreezedCl.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<Complex>(),
          reason: 'The output should be of type Complex',
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
