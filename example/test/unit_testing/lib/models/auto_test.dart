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
        'HjRbYHEjDdvjWGAaXQ',
        Automakers(
          <String>[],
          name: 'giko6m8eWvep1i7aFPCEaWA75T82xSejlkxH3DZZuL3MNM',
          country: 'O5X',
        ),
        <BodyStyle>[
          SuV(
            false,
          )
        ],
        variants: <String, int>{
          '9jZwTeO0086nrJZbUFT6mngiiWZjkdtRy94GbaPvJeDxqDmvP': 21,
        },
        avalebleColors: Colors.black,
        engines: <Engine>[
          GasolineEngine(
            hp: 30,
            fuelConsumption: 0.03508690169090389,
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
        modelName: 'NZW7W0K7mT102HUarLcQu9D88ZLQO',
        produser: DTOAutomakers(
          brands: <String>[],
          name: 'J9H8vDMIcMkfshIzqe4WVAYWyXR5xU04V4hn2eAY2bm3fkPuj',
          country: '8mj0wx6JZHjbModeU6AE9J4dPWVI5sFeMdkXuihLxx5wBeH',
        ),
        bodyStyles: <DTOBodyStyle_Union>[
          DTOBodyStyle_Union(
              suv: DTOSuV(
            is4WD: true,
          ))
        ],
        variants: jsonEncode(
          <String, int>{
            '46a9ugFjiyAviDA20T3daTMWDTttXP': 25,
          },
        ),
        avalebleColors: DTOColors.WTHITE,
        engines: <DTOEngine_Union>[
          DTOEngine_Union(
              gasolineengine: DTOGasolineEngine(
            hp: 59,
            fuelConsumption: 0.6173326729487835,
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
          cargoSpace: 0.6479148523468814,
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
          cargoSpace: 0.2698441596197858,
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
          hp: 4,
          fuelConsumption: 0.4185284457084878,
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
          hp: 19,
          fuelConsumption: 0.17139809898779823,
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
          hp: 57,
          fuelConsumption: 0.8419241966569407,
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
          hp: 5,
          fuelConsumption: 0.5513651564102042,
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
          67,
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
          hp: 52,
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
        name: 'lK9s1Lwqas4wIxnoeyo2LN9fIT8VNOyZ6NNOZkM1ugo0lOf',
        country: 'VdXFBs8oFA',
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
        name: 'vT4eVFBpMW3Oce9ERrFUZyIjUOCVhgusIjOZ5Xbek7OSLWExqIRaTUCqwLf',
        country: '7OceU',
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
        name: '0rz3XS1MIdxJcLwUiJlCUvrnoI9wuEBCapch4UqIHb89xiVrq',
        models: <CarModel>[
          CarModel(
            DateTime.now(),
            DateTime.now(),
            '0jtoo8FEgw47hF4',
            Automakers(
              <String>[],
              name: 'PIzKPRg4KOwtqzaEZ0dF',
              country:
                  '8mHtRiR56WFa5c3V0SttyVqkwqu8ZKRewIa1WgjQOTql7BDF8tQQkUDvGZVw',
            ),
            <BodyStyle>[
              SuV(
                true,
              )
            ],
            variants: <String, int>{
              '6yeT60Q': 84,
            },
            avalebleColors: Colors.blue,
            engines: <Engine>[
              GasolineEngine(
                hp: 20,
                fuelConsumption: 0.3868755398572915,
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
        name: 'HSCM8HI2NJKqLnXxyKttYAxdRTizQ6WSeJi9Lm2hpo',
        models: <DTOCarModel>[
          DTOCarModel(
            produsedAt: DateTime.now().toIso8601String(),
            dateOfSale: DateTime.now().toIso8601String(),
            modelName: 'TG0hqNdtQt5NkXIrXyvdbGKkWsMjtkOKkqRLBcs3',
            produser: DTOAutomakers(
              brands: <String>[],
              name: 'HhQTk7uqwF',
              country: 'jS3hNAdSV5haHaKn5fXp7',
            ),
            bodyStyles: <DTOBodyStyle_Union>[
              DTOBodyStyle_Union(
                  suv: DTOSuV(
                is4WD: false,
              ))
            ],
            variants: jsonEncode(
              <String, int>{
                'ej1llFT8yDUAV9BHn4rRa8gxviYsd2iZUITZSZBM38WF0': 52,
              },
            ),
            avalebleColors: DTOColors.WTHITE,
            engines: <DTOEngine_Union>[
              DTOEngine_Union(
                  gasolineengine: DTOGasolineEngine(
                hp: 23,
                fuelConsumption: 0.7364338278042656,
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
