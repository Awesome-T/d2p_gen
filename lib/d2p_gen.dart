import 'package:build/build.dart';

import 'src/builders/mapper_b.dart';
import 'src/builders/proto_unioner_b.dart';
import 'src/builders/protoc_runner_b.dart';
import 'src/builders/skipper.dart';
import 'src/builders/test_mapper_b.dart';
import 'src/builders/tmp_proto_b.dart';

/// The `TmpProtoBuilder` class is designed to automate the generation of temporary protocol buffer
/// files within a Dart project.
/// It encapsulates the logic necessary to inspect the annotated elements
/// (classes and enums) in the input library, generate corresponding protocol
///  buffer messages, and output them to the designated file format.
/// By implementing the `Builder` interface and extending  `ValueReader`,
/// it seamlessly integrates into the build process,providing developers with
/// a streamlined way to handle protocol buffer file generation without manual intervention.
/// A builder class for generating temporary protocol buffer files. This class
/// implements the [Builder] interface.
Builder tmpProto(BuilderOptions _) => TmpProtoBuilder();

/// The UnionProtoBuilder class, implementing the Builder interface,
/// facilitates the automated generation of proto files during the
/// build process. It searches for proto files matching a specified
/// pattern, concatenates their content, and writes the resulting
/// proto content to a designated output directory. Error handling
/// ensures that any exceptions during the build process are caught
/// and appropriately handled, maintaining the integrity of the build
/// pipeline.
Builder finalizerProto(BuilderOptions _) => UnionProtoBuilder(_);

/// A builder class responsible for running the `protoc`
/// compiler to generate Dart code from protobuf files.
Builder protocRunner(BuilderOptions _) => ProtocRunner();

/// The `MapperBuilder` class implements the `Builder` interface
/// and is responsible for generating mapper code based on annotated
/// elements in the input library. It reads annotations to identify
/// elements that require mapper generation. The class then generates
/// mapper classes for classes and enums marked with the `createMappers`
/// annotation set to true.
/// The `build` method orchestrates the generation process by
/// analyzing annotated elements, creating mapper classes using
/// `MapperClassBuilder` and `MapperEnumBuilder`, and writing the generated
/// code to a file. It also handles imports and ensures proper file
/// extension handling. Error handling is implemented to catch exceptions
/// and provide meaningful error messages. Finally, it checks if the
/// generated code meets a minimum line count threshold before writing
/// it to a file. If successful, it creates a file counter to track the
/// completion of mapper generation.
Builder tmpMapper(BuilderOptions _) => MapperBuilder();

/// This builder does nothing but wait for all markers
/// to be generated and a temporary file to be received.
/// The key is specified in the `build.yaml` file.
/// After that, the test builder will run and get
/// all .mp.dart files.
Builder sbuilder(BuilderOptions _) => EmptyBuilder();

/// Builder that generates test code based on annotated
/// classes and methods.
///
/// This builder analyzes the input Dart code and generates
/// unit tests for methods annotated with `toDTO`.
/// The generated tests include assertions to verify that
/// the output matches the expected format.
/// If a method returns an enum, it generates tests to ensure
/// the correct behavior of enum mapping.
Builder testBuildet(BuilderOptions _) => TestBuilder();
