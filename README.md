# d2p_gen

The "d2p_proto" Dart package facilitates the automatic generation of protocol buffer files (.proto) by leveraging Dart code annotations provided by the [d2p_annotation](https://github.com/Awesome-T/d2p_annotation) package. It streamlines the process of creating .g.proto files, mappers, and associated tests, enhancing the efficiency of working with protocol buffers in Dart projects.

## Reason

Protocol Buffers (Proto) provides a compact representation of data, reducing the size of transmitted messages by up to 3-5 times compared to JSON. With more efficient serialization and deserialization, using Proto speeds up data exchange by 30-40%. Proto's data typing and strict schema simplify development and provide more robust data validation, making it the preferred choice for distributed systems.

## Installation

To use [d2p_gen], you will need your typical [build_runner]/code-generator setup.\
First, install [build_runner] and [d2p_gen] by adding them to your `pubspec.yaml` file:

```yaml
dependencies:
 d2p_annotation: any
 # other dependencies
dev_dependencies:
  d2p_gen: any
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

Place annotations under the classes that you prefer to receive notifications from.

```dart

import 'package:d2p_annotation/d2p_annotation.dart';

@ProtoGen(createMappers: false)
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

This package create a new foldeer at the root directory of project proto with single file `messages.g.proto` with all of your proto messeges. For this class it will look like this:

```proto
syntax = "proto3";
package messages;
// -- Some other messages.
/*
  class: User
*/
  message DTOUser {
    // String User.name
    string name = 1;
    // int User.age
    int32 age = 2;
  }

```

If you use the `@ProtoGen` annotation with the `createMappers` option set to `true`, you will also get a mapper class that can convert the generated Dart code into the model class and vice versa. These mapper classes are always saved in separate files with a `.mp.dart` extension.

```dart
/// Mapper that converts a DTO [DTOUser] object
/// into a Model [User] and back.
abstract class $MapperUser {
  /// Converts the model [User]
  /// to the DTO [DTOUser].
  static User fromDTO(DTOUser model) {
    try {
      return User(
        model.name,
        model.age,
      );
    } on FormatException catch (e, trace) {
      throw FormatException(
        '''Exception
      ${e.source}
      ${e.message}
      $trace''',
      );
    }
  }

  /// Converts the model [User]
  /// to the DTO [DTOUser]
  static DTOUser toDTO(User model) {
    try {
      return DTOUser(
        name: model.name,
        age: model.age,
      );
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

In order to ensure that the mapper function operates correctly, the tool also generates a test case for each mapper function.

```dart

  group(r'Testing $MapperUser methods', () {
// Test the toDTO method (which returns a DTO class)
    test(r'$MapperUser.toDTO Output class User should be DTOUser', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final model = User(
        'ZymI7ohW2Dq9XeUE',
        49,
      );

      // Act - Call the function that is to be tested
      final dto = $MapperUser.toDTO(model);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        dto,
        TypeMatcher<DTOUser>(),
        reason: 'The output should be of type DTOUser',
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
    test(r'$MapperUser.fromDTO Output class User should be User', () {
      // Arrange - Setup facts, Put Expected outputs or Initialize
      final dto = DTOUser(
        name: '8O',
        age: 48,
      );

      // Act - Call the function that is to be tested
      final model = $MapperUser.fromDTO(dto);

      // Assert - Compare the actual result and expected result
      // Check if the output is of the expected type
      expect(
        model,
        TypeMatcher<User>(),
        reason: 'The output should be of type User',
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
```

Once all relevant files have been created, the testing of the mapper will begin automatically. You will then see a screen similar to the one below.

```console
🎉 2 tests passed.
```

### Table of comparison of Dart types to Proto which is implemented by the package

                | proto3   | dart     |
                |----------|----------|
                | double   | double   |
                | double   | mun      |
                | Int64    | int      |
                | bool     | bool     |
                | string   | String   |
                | string   | Map      |
                | enum     | enum     |
                | repeated | Iterables|

> Full comparison of proto types to programming languages on the official website [website](https://protobuf.dev/programming-guides/proto3/#scalar)
 <!-- > It's not a -->