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
        'fGXfLfgv2nCpNj0eklVCEZn1EAhBvAKMVwtSYDEmLzKoqb1',
        Automakers(
          <String>[],
          name: 'ajz12wpttvsf3k4DpFlnJqE',
          country: 'AYLAbe',
        ),
        <BodyStyle>[
          SuV(
            false,
          )
        ],
        variants: <String, int>{
          'jbbrTGKZTRANKP0Gy8ZZ2YdeJZXbdG681IQ6XwrKtvPuDHtpIgRP79T4LHK': 15,
        },
        avalebleColors: Colors.green,
        engines: <Engine>[
          GasolineEngine(
            hp: 57,
            fuelConsumption: 0.5123222271445658,
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
        modelName: 'RakkHqhxDuS5uz8Sn8lGXvOEtEVwVqXqqKA',
        produser: DTOAutomakers(
          brands: <String>[],
          name: 'oIDSMMe',
          country: '5aYXpx0UFy6L49DS5vgxELhuJC5OkMuHot',
        ),
        bodyStyles: <DTOBodyStyle_Union>[
          DTOBodyStyle_Union(
              suv: DTOSuV(
            is4WD: true,
          ))
        ],
        variants: jsonEncode(
          <String, int>{
            'e3rUY7LP5CMixdHwsVhtaXTKT0uHhJJ3EwjgBy4qTS5W57QDxDA0ZlRFGcf': 46,
          },
        ),
        avalebleColors: DTOColors.WTHITE,
        engines: <DTOEngine_Union>[
          DTOEngine_Union(
              gasolineengine: DTOGasolineEngine(
            hp: 82,
            fuelConsumption: 0.18914318572499855,
          ))
        ],
        gear: DTOGears.AUTO,
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
          cargoSpace: 0.516202379620836,
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
          cargoSpace: 0.7535668555312968,
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
          hp: 55,
          fuelConsumption: 0.32521841712168287,
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
          hp: 77,
          fuelConsumption: 0.3684058099034144,
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
          hp: 53,
          fuelConsumption: 0.6947859406767822,
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
          hp: 79,
          fuelConsumption: 0.4743096233518109,
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
          3,
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
          hp: 88,
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
        name: '2vOk4wUjZ0cr6OdPX8Ij2Abi6PUIV8',
        country: '7zuVAYCBvS1up2EWwGQW1XDQNnp2IKAXvdNpIRGeSmEw3sPee1vZWjiX2x',
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
        name: 'maJdS7jS4ey2Va5e7P1J8dH6itbQkLh4Ck4bS8BQ',
        country: 'RI4R7okeaZKbPu9nNb0',
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
        name: '1bBxL8yhiOwUdlSuyXIm3vQAms',
        models: <CarModel>[
          CarModel(
            DateTime.now(),
            DateTime.now(),
            '1jWcAmCRlljVPt8zhkU7sbqDAwP',
            Automakers(
              <String>[],
              name: 'Mef3f6rzAw6yYRTH4GhQIv',
              country:
                  'QJFYaIioyh9bpmj8mMoeoLDDneEtMoiUkG7VSBtyShKCZXOzH8r0v6MKMWN',
            ),
            <BodyStyle>[
              SuV(
                false,
              )
            ],
            variants: <String, int>{
              'IZnWogOO1akGHZpx': 68,
            },
            avalebleColors: Colors.black,
            engines: <Engine>[
              GasolineEngine(
                hp: 81,
                fuelConsumption: 0.041519616845770435,
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
        name: 'y4JJLIRaREUHWcaGDXOC1k5tENPrX2fZO258FHa',
        models: <DTOCarModel>[
          DTOCarModel(
            produsedAt: DateTime.now().toIso8601String(),
            dateOfSale: DateTime.now().toIso8601String(),
            modelName: 'AK7xIdJzwF2sPotfUeg3OveY7UoGyHjZBAHZeD',
            produser: DTOAutomakers(
              brands: <String>[],
              name: 'FoAZcbGr8IpA',
              country: 'WvZHlyEe',
            ),
            bodyStyles: <DTOBodyStyle_Union>[
              DTOBodyStyle_Union(
                  suv: DTOSuV(
                is4WD: true,
              ))
            ],
            variants: jsonEncode(
              <String, int>{
                'rlpHCXI1hG': 69,
              },
            ),
            avalebleColors: DTOColors.BLUE,
            engines: <DTOEngine_Union>[
              DTOEngine_Union(
                  gasolineengine: DTOGasolineEngine(
                hp: 15,
                fuelConsumption: 0.29529886482127465,
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
