# Changelog

All notable changes to this project will be documented in this file.

## [0.0.1] - 2023-02-12

Initial version.

## [1.0.0] - 2024-03-31

#### Fexed bugs:

- Fixed bugs related to mapper generation. Parameters of classes must now have strict types (not dynamic) and cannot be Dart base types or asynchronous types. Any violation of these rules will result in a build error.

#### Feature

- Added feature to generate and run tests for DTO mappers.

## [1.0.3] - 2024-04-01

#### Fexed bugs:

When adding a new class and saving it, the Protobuf tool did not start. After that, the test builder crashed due to an error in the AST node.
