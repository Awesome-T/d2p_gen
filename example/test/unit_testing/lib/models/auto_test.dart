import 'package:example/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:example/models/auto.mp.dart';
import 'package:example/models/auto.dart';

void main() {
  group(r'Testing $MapperCarModel methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperCarModel.toDTO Output class CarModel should be DTOCarModel',
        () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = CarModel(
        DateTime.now(),
        DateTime.now(),
        'gtu6OPsTNnx44vS9h5FiSdmVAQENJ0WBic9eiZ2XYuNpi',
        Automakers(
          <String>[],
          name: 'hJU6TVsRKEMmNeFlgcLE0MqxYvmO7KFTnFs7ZlxhNohnzrhG09JWH0Ug',
          country: 'ofJT2XbjRmiBZ0oDWJtEOuWzN2MfJ5TaMYDjmmz5YHiBJVVnBAAm',
        ),
        <BodyStyle>[
          SuV(
            true,
          )
        ],
        variants: <String, int>{
          'RLp71QDY978sYyhCQ65ETi': 76,
        },
        avalebleColors: Colors.blue,
        engines: <Engine>[
          GasolineEngine(
            hp: 0,
            fuelConsumption: 0.5132069918408657,
          )
        ],
        gear: Gears.auto,
      );

      // Act - Call the function that is to be tested
      final dto = $MapperCarModel.toDTO(model);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<DTOCarModel>(),
        reason: 'The output should be of type DTOCarModel',
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
    test(r'$MapperCarModel.fromDTO Output class CarModel should be CarModel',
        () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final dto = DTOCarModel(
        produsedAt: DateTime.now().toIso8601String(),
        dateOfSale: DateTime.now().toIso8601String(),
        modelName: 'EYeFwfA7KpZfl3g55qoVg5JqW5NcbKyuI0pqWG2lVoCbYYFutL9lQnN8T',
        produser: DTOAutomakers(
          brands: <String>[],
          name: 'Wecax7DpLOnB5',
          country: 'FONdFkhLnqU7ArOk3LIh1F5b31cssa0e6IkmrfOF',
        ),
        bodyStyles: <DTOBodyStyle_Union>[
          DTOBodyStyle_Union(
              suv: DTOSuV(
            is4WD: false,
          ))
        ],
        variants: jsonEncode(
          <String, int>{
            'Ee8AnHmjn4FqikwYPe2z1mIeb21CeCAssdobLw1RfQF67': 5,
          },
        ),
        avalebleColors: DTOColors.BLACK,
        engines: <DTOEngine_Union>[
          DTOEngine_Union(
              gasolineengine: DTOGasolineEngine(
            hp: 87,
            fuelConsumption: 0.02977193636464248,
          ))
        ],
        gear: DTOGears.NAMUAL,
      );

      // Act - Call the function that is to be tested
      final model = $MapperCarModel.fromDTO(dto);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<CarModel>(),
        reason: 'The output should be of type CarModel',
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

  group(r'Testing $MapperBodyStyle', () {
    group(r'Testing $MapperBodyStyle methods for SuV', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperBodyStyle.toDTO Output class SuV should be DTOBodyStyle_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = SuV(
          false,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperBodyStyle.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOBodyStyle_Union>(),
          reason: 'The output should be of type DTOBodyStyle_Union',
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
      test(r'$MapperBodyStyle.fromDTO Output class SuV should be SuV', () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOBodyStyle_Union(
            suv: DTOSuV(
          is4WD: true,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperBodyStyle.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<SuV>(),
          reason: 'The output should be of type SuV',
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

    group(r'Testing $MapperBodyStyle methods for Coupe', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperBodyStyle.toDTO Output class Coupe should be DTOBodyStyle_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = Coupe(
          true,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperBodyStyle.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOBodyStyle_Union>(),
          reason: 'The output should be of type DTOBodyStyle_Union',
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
      test(r'$MapperBodyStyle.fromDTO Output class Coupe should be Coupe', () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOBodyStyle_Union(
            coupe: DTOCoupe(
          isFoldingRoof: false,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperBodyStyle.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<Coupe>(),
          reason: 'The output should be of type Coupe',
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

    group(r'Testing $MapperBodyStyle methods for Pickup', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperBodyStyle.toDTO Output class Pickup should be DTOBodyStyle_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = Pickup(
          cargoSpace: 0.9658102659981004,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperBodyStyle.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOBodyStyle_Union>(),
          reason: 'The output should be of type DTOBodyStyle_Union',
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
      test(r'$MapperBodyStyle.fromDTO Output class Pickup should be Pickup',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOBodyStyle_Union(
            pickup: DTOPickup(
          cargoSpace: 0.6855721423652567,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperBodyStyle.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<Pickup>(),
          reason: 'The output should be of type Pickup',
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
  group(r'Testing $MapperEngine', () {
    group(r'Testing $MapperEngine methods for GasolineEngine', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperEngine.toDTO Output class GasolineEngine should be DTOEngine_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = GasolineEngine(
          hp: 53,
          fuelConsumption: 0.8283244313614923,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperEngine.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOEngine_Union>(),
          reason: 'The output should be of type DTOEngine_Union',
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
          r'$MapperEngine.fromDTO Output class GasolineEngine should be GasolineEngine',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOEngine_Union(
            gasolineengine: DTOGasolineEngine(
          hp: 1,
          fuelConsumption: 0.5573032091030642,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperEngine.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<GasolineEngine>(),
          reason: 'The output should be of type GasolineEngine',
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

    group(r'Testing $MapperEngine methods for DiselEngine', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperEngine.toDTO Output class DiselEngine should be DTOEngine_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = DiselEngine(
          hp: 98,
          fuelConsumption: 0.034762380927869985,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperEngine.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOEngine_Union>(),
          reason: 'The output should be of type DTOEngine_Union',
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
          r'$MapperEngine.fromDTO Output class DiselEngine should be DiselEngine',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOEngine_Union(
            diselengine: DTODiselEngine(
          hp: 9,
          fuelConsumption: 0.6562174242747567,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperEngine.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<DiselEngine>(),
          reason: 'The output should be of type DiselEngine',
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

    group(r'Testing $MapperEngine methods for ElectricEngine', () {
// Test the toDTO method (which returns a DTO class)
      test(
          r'$MapperEngine.toDTO Output class ElectricEngine should be DTOEngine_Union',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final model = ElectricEngine(
          24,
        );

        // Act - Call the function that is to be tested
        final dto = $MapperEngine.toDTO(model);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          dto,
          TypeMatcher<DTOEngine_Union>(),
          reason: 'The output should be of type DTOEngine_Union',
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
          r'$MapperEngine.fromDTO Output class ElectricEngine should be ElectricEngine',
          () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOEngine_Union(
            electricengine: DTOElectricEngine(
          hp: 54,
        ));

        // Act - Call the function that is to be tested
        final model = $MapperEngine.fromDTO(dto);

        // Assert - Compare the actual result and expected result
        // Check if the output is of the expected type
        expect(
          model,
          TypeMatcher<ElectricEngine>(),
          reason: 'The output should be of type ElectricEngine',
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
  group(r'Testing $MapperAutomakers methods', () {
// Test the toDTO method (which returns a DTO class)
    test(
        r'$MapperAutomakers.toDTO Output class Automakers should be DTOAutomakers',
        () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = Automakers(
        <String>[],
        name: 'b',
        country: 'FpoeZ9dJGANmJkCXdo6Whv3xsdvkRi8LHZh',
      );

      // Act - Call the function that is to be tested
      final dto = $MapperAutomakers.toDTO(model);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<DTOAutomakers>(),
        reason: 'The output should be of type DTOAutomakers',
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
        r'$MapperAutomakers.fromDTO Output class Automakers should be Automakers',
        () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final dto = DTOAutomakers(
        brands: <String>[],
        name: 'FDgwfE0PU8c2Svg41ODTzhevQGnkIYpMXFeCc54LkNevbiEwqI',
        country: 'GU1v9PGXm',
      );

      // Act - Call the function that is to be tested
      final model = $MapperAutomakers.fromDTO(dto);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<Automakers>(),
        reason: 'The output should be of type Automakers',
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

  group(r'Testing $MapperBrand methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperBrand.toDTO Output class Brand should be DTOBrand', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = Brand(
        name: 'udMrifCffWaH4TJ7gk22SyqDLkeScvfjIQIYEOTO6itPSSCYvm',
        models: <CarModel>[
          CarModel(
            DateTime.now(),
            DateTime.now(),
            '',
            Automakers(
              <String>[],
              name: '9ZpMkXzyNozcGAKsZMfWu5kivmt98UAOq5JeTCSuqJSOi2AM1eNG',
              country:
                  '34I6UUVPJoDV3R0jfTy3rMhPvcGHw0tMtEKrlhKYXnEfwjhsFebAw5ipFM9CK',
            ),
            <BodyStyle>[
              SuV(
                false,
              )
            ],
            variants: <String, int>{
              'l7tNdLFIbac6tDRv5KvT0FCg4ewSemQwnGptetb8kYPxoJoP9h0QQfD': 65,
            },
            avalebleColors: Colors.red,
            engines: <Engine>[
              GasolineEngine(
                hp: 14,
                fuelConsumption: 0.701047873672026,
              )
            ],
            gear: Gears.namual,
          )
        ],
      );

      // Act - Call the function that is to be tested
      final dto = $MapperBrand.toDTO(model);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<DTOBrand>(),
        reason: 'The output should be of type DTOBrand',
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
    test(r'$MapperBrand.fromDTO Output class Brand should be Brand', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final dto = DTOBrand(
        name: 'LFcjyHffQlmhNVglwWTP6KXJb6YQj8g7LgZCES9Jo3sMIOO65YRx',
        models: <DTOCarModel>[
          DTOCarModel(
            produsedAt: DateTime.now().toIso8601String(),
            dateOfSale: DateTime.now().toIso8601String(),
            modelName: 'njbTNjbJD',
            produser: DTOAutomakers(
              brands: <String>[],
              name: 'lPWSpTmpJUav4Z1',
              country:
                  'RSRPWenqVdCtg1HkU2s8nzzAJwFXl87BaOFqG8fnDAK9XNhOWik7gEyMpR2',
            ),
            bodyStyles: <DTOBodyStyle_Union>[
              DTOBodyStyle_Union(
                  suv: DTOSuV(
                is4WD: false,
              ))
            ],
            variants: jsonEncode(
              <String, int>{
                'y0aquykEecjsr4T49y4of9kL38LNtuF8DC8Tjqnvg6awa3nvJ8VUP8DY': 17,
              },
            ),
            avalebleColors: DTOColors.RED,
            engines: <DTOEngine_Union>[
              DTOEngine_Union(
                  gasolineengine: DTOGasolineEngine(
                hp: 9,
                fuelConsumption: 0.3753331516886034,
              ))
            ],
            gear: DTOGears.AUTO,
          )
        ],
      );

      // Act - Call the function that is to be tested
      final model = $MapperBrand.fromDTO(dto);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<Brand>(),
        reason: 'The output should be of type Brand',
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

  group(r'Testing $MapperGears methods', () {
    //
    test('Output enum $Gears should be $DTOGears', () {
      final dto = Gears.values.first;
      final model = $MapperGears.toDTO(dto);
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<DTOGears>(),
        reason: 'The output should be of type DTOGears',
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
    test('Output enum $Gears should be $DTOGears', () {
      final model = DTOGears.values.first;
      final dto = $MapperGears.fromDTO(model);
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<Gears>(),
        reason: 'The output should be of type Gears',
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

  group(r'Testing $MapperColors methods', () {
    //
    test('Output enum $Colors should be $DTOColors', () {
      final dto = Colors.values.first;
      final model = $MapperColors.toDTO(dto);
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<DTOColors>(),
        reason: 'The output should be of type DTOColors',
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
    test('Output enum $Colors should be $DTOColors', () {
      final model = DTOColors.values.first;
      final dto = $MapperColors.fromDTO(model);
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<Colors>(),
        reason: 'The output should be of type Colors',
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
