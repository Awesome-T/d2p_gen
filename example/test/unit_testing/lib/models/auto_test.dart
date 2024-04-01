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
        'Zoj9',
        Automakers(
          <String>[],
          name: 'V9QVgexas6d1ciubGcaWIZsj4V6JJ2YU072bwcsm',
          country: 'FRrwrY7t0w2NZFqh13H2oKwl5BDUjuGyg7jKFxMW5zh2uFMBIIouQ',
        ),
        <BodyStyle>[
          SuV(
            false,
          )
        ],
        variants: <String, int>{
          'p3nAm8Q4zbTxha5nftdZLyms0n28A0065G': 34,
        },
        avalebleColors: Colors.blue,
        engines: <Engine>[
          GasolineEngine(
            hp: 85,
            fuelConsumption: 0.98784336254221,
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
        modelName: '2wau439olrQ1xpNaLOdsiX0gM2Dgq353rPw992htkfJ5U2lWLl',
        produser: DTOAutomakers(
          brands: <String>[],
          name: 'W1UtHk8GWEerhG',
          country: 'yRRpNM0EP',
        ),
        bodyStyles: <DTOBodyStyle_Union>[
          DTOBodyStyle_Union(
              suv: DTOSuV(
            is4WD: false,
          ))
        ],
        variants: jsonEncode(
          <String, int>{
            'MCacjlFza7g9ZudMVm0D5Y0zk58bw6NZLKcDeB': 60,
          },
        ),
        avalebleColors: DTOColors.BLUE,
        engines: <DTOEngine_Union>[
          DTOEngine_Union(
              gasolineengine: DTOGasolineEngine(
            hp: 26,
            fuelConsumption: 0.14180736658554505,
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
          cargoSpace: 0.6830785567036791,
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
          cargoSpace: 0.6806856612077501,
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
          hp: 97,
          fuelConsumption: 0.3687757066536125,
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
          hp: 52,
          fuelConsumption: 0.7490069817786102,
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
          hp: 86,
          fuelConsumption: 0.6710782808533214,
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
          hp: 53,
          fuelConsumption: 0.6842208060293937,
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
          36,
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
          hp: 25,
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
        name: '',
        country: 'Zv9ry',
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
        name: 'DUcgSPTbcigjPOG6PHFAlM0RxU3K6Jgh5d',
        country: 'sN31EP52ku2dHmvLDBrUShDEIZ27OI',
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
        name: 'uGv32uaokDHVOHYt1CUqSBplUv13zcFXNWsdG32697',
        models: <CarModel>[
          CarModel(
            DateTime.now(),
            DateTime.now(),
            'E0vAKuNhNifGkQDylhGQhaswuPXejguDBGPLz9oPYurGNiWBSdhS',
            Automakers(
              <String>[],
              name: 'uE0pwpdPLYYsBL8DVUcwuUZb18Mk3UG',
              country: '4jsp8dgCPr',
            ),
            <BodyStyle>[
              SuV(
                true,
              )
            ],
            variants: <String, int>{
              '8K5': 29,
            },
            avalebleColors: Colors.green,
            engines: <Engine>[
              GasolineEngine(
                hp: 38,
                fuelConsumption: 0.4418282444601044,
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
        name: 'jT',
        models: <DTOCarModel>[
          DTOCarModel(
            produsedAt: DateTime.now().toIso8601String(),
            dateOfSale: DateTime.now().toIso8601String(),
            modelName: '5GubFvJP0MJMoi2ANKMOJNK0qBDSfzNptoB',
            produser: DTOAutomakers(
              brands: <String>[],
              name: '3CXc7QaABID5OeeCGRCCXc5rmUYXkew7fzzb3kRB18k1HXnXawrlqpps6',
              country: 'EKFQ',
            ),
            bodyStyles: <DTOBodyStyle_Union>[
              DTOBodyStyle_Union(
                  suv: DTOSuV(
                is4WD: true,
              ))
            ],
            variants: jsonEncode(
              <String, int>{
                '2K61l9jqEb3NEQSFjTGIlTgPIsRhfkhG1M': 4,
              },
            ),
            avalebleColors: DTOColors.GREEN,
            engines: <DTOEngine_Union>[
              DTOEngine_Union(
                  gasolineengine: DTOGasolineEngine(
                hp: 88,
                fuelConsumption: 0.9254096273078322,
              ))
            ],
            gear: DTOGears.NAMUAL,
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
