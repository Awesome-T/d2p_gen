import 'package:exap/generated/proto/messages.g.pb.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:exap/models/auto.mp.dart';
import 'package:exap/models/auto.dart';

void main() {
  group(r'Testing $MapperCarModel methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperCarModel.toDTO Output class CarModel should be DTOCarModel',
        () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = CarModel(
        DateTime.now(),
        DateTime.now(),
        'tnyh55',
        Automakers(
          <String>[],
          name: 'aR0qOEzq',
          country: 'iuUBwOBSdpEpmbgLYhTalj9fQibvvIR1J1TooC',
        ),
        <BodyStyle>[
          SuV(
            false,
          )
        ],
        variants: <String, int>{
          '99ic2qSvEGbhfWJeaF1V4P9XvIbOQQJYXAEjzig5t16LBveXiG': 81,
        },
        avalebleColors: Colors.black,
        engines: <Engine>[
          GasolineEngine(
            hp: 96,
            fuelConsumption: 0.4458780552570054,
          )
        ],
        gear: Gears.namual,
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
        modelName: 'z4fcji',
        produser: DTOAutomakers(
          brands: <String>[],
          name: 'yJrDcDiX5',
          country: 'HF7gw5oJlatV9KO0XLFvnkpIsZM8W1KukBieyg6P1CumI',
        ),
        bodyStyles: <DTOBodyStyle_Union>[
          DTOBodyStyle_Union(
              suv: DTOSuV(
            is4WD: false,
          ))
        ],
        variants: jsonEncode(
          <String, int>{
            'HZsExiUEsSJ69dHb10gJB5K': 85,
          },
        ),
        avalebleColors: DTOColors.BLACK,
        engines: <DTOEngine_Union>[
          DTOEngine_Union(
              gasolineengine: DTOGasolineEngine(
            hp: 24,
            fuelConsumption: 0.6889427287135673,
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
          is4WD: false,
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
      test(r'$MapperBodyStyle.fromDTO Output class Coupe should be Coupe', () {
        // Arrange - Setup facts, Put Expected outputs or Initialize
        final dto = DTOBodyStyle_Union(
            coupe: DTOCoupe(
          isFoldingRoof: true,
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
          cargoSpace: 0.5433912639905517,
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
          cargoSpace: 0.8749890786647244,
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
          hp: 61,
          fuelConsumption: 0.443033721981679,
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
          hp: 65,
          fuelConsumption: 0.9371190110666804,
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
          hp: 12,
          fuelConsumption: 0.9851287412799049,
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
          hp: 57,
          fuelConsumption: 0.24984665783632032,
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
          39,
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
          hp: 34,
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
        name: 'e6PMNIDs0lRlpQ1pDNigkwI1RB81hBwj9ZdYftCH0',
        country: 'xEJHx30OuwzadMvU2shZ9VEj1TsGn5OLMbqN7iVU',
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
        name: 'Bz7h6L6hc334aEz9grgZS3e',
        country: '1DPs0dP2BqhIM4Zx',
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
        name: 'Sf58',
        models: <CarModel>[
          CarModel(
            DateTime.now(),
            DateTime.now(),
            'Ny8Kx6X2yYftbBjtYS3FrSghal3llKvV4V',
            Automakers(
              <String>[],
              name: 'YFKeE9JcZ1Jt85H2Vb59',
              country: 'mYPXYnyOv5kRs44YtzLAp97vl7GPBScSPKh8k',
            ),
            <BodyStyle>[
              SuV(
                true,
              )
            ],
            variants: <String, int>{
              'vIToHIiZyQU1MYiEjBA7CNFqj93HcHUiPf8xNfaejsP1USins9u': 70,
            },
            avalebleColors: Colors.blue,
            engines: <Engine>[
              GasolineEngine(
                hp: 26,
                fuelConsumption: 0.14976402149448753,
              )
            ],
            gear: Gears.auto,
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
        name: 'QbPXntDygKKRZpetlatbxWVGB6lwFMU0dnc0PdKKFsD5xcNT1VZnx9Z062EkX',
        models: <DTOCarModel>[
          DTOCarModel(
            produsedAt: DateTime.now().toIso8601String(),
            dateOfSale: DateTime.now().toIso8601String(),
            modelName:
                'rSxEGXUDTiuHJaOPxNMYx3rbRBYVoylQhqinJb8O2JDK0HruH6hNFQaN2',
            produser: DTOAutomakers(
              brands: <String>[],
              name: '67bXMEe',
              country: 'nak0fIf4AGvgDk4gwZ',
            ),
            bodyStyles: <DTOBodyStyle_Union>[
              DTOBodyStyle_Union(
                  suv: DTOSuV(
                is4WD: true,
              ))
            ],
            variants: jsonEncode(
              <String, int>{
                'xF2ywaSZinGAg5Yw8H8': 45,
              },
            ),
            avalebleColors: DTOColors.WTHITE,
            engines: <DTOEngine_Union>[
              DTOEngine_Union(
                  gasolineengine: DTOGasolineEngine(
                hp: 90,
                fuelConsumption: 0.37046601923330447,
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
