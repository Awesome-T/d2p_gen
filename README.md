# d2p_gen

A Dart package for generating protocol buffer files (.proto) based on Dart code annotations [d2p_annotation](https://github.com/Awesome-T/d2p_annotation )

 <!-- > It's not a -->

<!-- ## How to use -->

## Installation

To use [d2p_gen], you will need your typical [build_runner]/code-generator setup.\
First, install [build_runner] and [d2p_gen] by adding them to your `pubspec.yaml` file:

```yaml
dependencies:
 d2p_annotation:
 # other dependencies
dev_dependencies:
  d2p_gen:
```

Alternativies for install the package - run conamd folowwing comand:

- For a Flutter project:

```console
flutter pub add d2p_annotation
flutter pub add dev:build_runner
flutter pub add dev:d2p_gen
```

- -For a Dart project:

```console
dart pub add d2p_annotation
dart pub add dev:build_runner
dart pub add dev:d2p_gen
```

## Annotation

Put annotation under the clases wich you prefer to generate message.

```dart
import 'package:d2p_gen/d2p_gen.dart';

@ProtoGen(createMappers:false)
class User {
  final String name;
  final int age;
  const User(this.name, this.age);
}
```

run the following command:

```bash
dart run build_runner build
```

result' be like this:

```proto
<!-- some other fields -->
message User {
  string name = 1;
  int32 age = 2;
}
```

if you need union classes, example below:

```dart
@ProtoGen()
sealed class Animal {
  const Animal();
}
@ProtoGen(createMappers: true)
class Cow extends Animal {
  final int? weight;
  final String? nullableString;
  final DateTime? nullableDateTime;
  const Cow({
    this.weight,
    this.nullableString,
    this.nullableDateTime,
  });
}
@ProtoGen(createMappers: true)
class Sheep extends Animal {
  final String one;
  const Sheep({required this.one});
}
```

run the following command

```bash
dart run build_runner build
```

The result will look like this:

```proto
/*
  class: Cow
  Source: 'package:/exap/lib/models/sealeds.dart';
*/
  message DTOCow {
    // int? Cow.weight
    optional int32 weight = 1;
    // String? Cow.nullableString
    optional string nullableString = 2;
    // DateTime? Cow.nullableDateTime
    optional string nullableDateTime = 3;
  }

/*
  class: Sheep
  Source: 'package:/exap/lib/models/sealeds.dart';
*/
  message DTOSheep {
    // String Sheep.one
    string one = 1;
  }

/*
 * class: animal
*/
  message DTOAnimal_Union   {
    //single inherited  class of Animal 
    oneof animal {
       //class Cow
       DTOCow cow = 1;
       //class Sheep
       DTOSheep sheep = 2;
    }
  }
```

As you can see, at the moment we are receiving not only an addition message for the inherited class, but also a converter to convert the DTO to the model and back.

```dart
/// Mapper that converts a DTO [DTOAnimal_Union] object
/// into a Model [Animal] and back.
abstract class $MapperAnimal {
  /// Converts the model [Animal]
  /// to the DTO [DTOAnimal_Union].
  static Animal fromDTO(DTOAnimal_Union model) {
    try {
      if (model.hasCow()) {
        return Cow(
          weight: model.cow.weight,
          nullableString: model.cow.nullableString,
          nullableDateTime: DateTime.tryParse(model.cow.nullableDateTime),
        );
      }
      if (model.hasSheep()) {
        return Sheep(
          one: model.sheep.one,
        );
      } else {
        throw FormatException('No valid DTO $model');
      }
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the DTO [DTOAnimal_Union]
  /// to the model [Animal]
  static DTOAnimal_Union toDto(Animal model) {
    try {
      if (model is Cow) {
        return DTOAnimal_Union(
          cow: DTOCow(
            weight: model.weight,
            nullableString: model.nullableString,
            nullableDateTime: model.nullableDateTime?.toIso8601String(),
          ),
        );
      }
      if (model is Sheep) {
        return DTOAnimal_Union(
          sheep: DTOSheep(
            one: model.one,
          ),
        );
      } else {
        throw FormatException('No valid DTO $model');
      }
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }
}
```
