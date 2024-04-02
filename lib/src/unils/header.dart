///
const NAME_PROTO_PACKAGE = 'messages';
const _SYNTAX = 'proto3';

final String header = '''
syntax = "$_SYNTAX";
package $NAME_PROTO_PACKAGE;

// [START declaration]
// import "google/protobuf/any.proto";
// import "google/protobuf/api.proto";
// import "google/protobuf/duration.proto";
// import "google/protobuf/empty.proto";
// import "google/protobuf/field_mask.proto";
// import "google/protobuf/source_context.proto";
// import "google/protobuf/struct.proto";
// import "google/protobuf/timestamp.proto";
// import "google/protobuf/type.proto";
// import "google/protobuf/wrappers.proto";
// [END declaration]

// option go_package = "$NAME_PROTO_PACKAGE";
// option php_namespace = "protoc\m$NAME_PROTO_PACKAGE";
// option php_metadata_namespace = "$NAME_PROTO_PACKAGE";
// option java_package = "io.grpc.gen.$NAME_PROTO_PACKAGE";
option java_outer_classname = "${NAME_PROTO_PACKAGE[0].toUpperCase()}${NAME_PROTO_PACKAGE.substring(1, NAME_PROTO_PACKAGE.length)}Proto";
option java_multiple_files = true;
option java_generic_services = false;
// [END java_declaration]
// [SPEED,CODE_SIZE,LITE_RUNTIME]
option optimize_for = SPEED;

// This file relies on plugins to generate service code.
option cc_generic_services = false;
option py_generic_services = false;

// [START csharp_declaration]
// option csharp_namespace = "Google.Protobuf.Examples.AddressBook";
// [END csharp_declaration]

// [START go_declaration]
// option go_package = "github.com/protocolbuffers/protobuf/examples/go/tutorialpb";
// [END go_declaration]

option objc_class_prefix = "RTG";

// **************************************************************************
//                               DATA TYPES
//                           proto3   |   Dart
//                           ---------|-----------
//                           double   |   double
//                           Int64    |   int
//                           bool     |   bool
//                           string   |   String
//                           string   |   Map
//                           enum     |   enum
//                           repeated |   Iterables
//                           string   |   DateTime                           
// **************************************************************************
// Generated At at ${DateTime.now().toUtc()}

/*
      google/protobuf/empty.proto \
      google/protobuf/source_context.proto \
      google/protobuf/struct.proto \
      google/protobuf/any.proto \
      google/protobuf/api.proto \
      google/protobuf/type.proto \
      google/protobuf/duration.proto \
      google/protobuf/field_mask.proto \
      google/protobuf/wrappers.proto \

    To start generating the DTO `.dart` files, 
    please run the following command in the terminal:


    ```dart
      dart pub global activate protoc_plugin && \\
      protoc \\
      --proto_path= \\
      proto/messages${OutputFormats.gProto.val} \\
      proto/grpc_service.proto \\
      --dart_out=grpc:lib/generated
    ```
*/

''';

/// outputs must be unique across all builders.
enum OutputFormats {
  /// extinsion for files wich'll be export to a separeted fise `.dart`:
  tmpProto('.tmp_proto'),

  /// base extession
  dart('.dart'),

  ///`.g.proto`
  gProto('.g.proto'),

  ///`.tmp_mp`
  tmpMapperDart('.tmp_mp'),
  // # cTest('c_t.t'),
  // # cMp('c_mp.tmp1'),
  // # mapperCreated('.tmp2'),
  ///
  cTest('c_t.t'),

  ///
  cMp('c_mp.tmp1'),

  ///
  mapperCreated('.tmp2'),

  ///`.mp.dart`
  mapperDart('.mp.dart'),

  ///
  testExIn('{{}}.mp.dart'),

  ///
  testExOut('test/unit_testing/{{}}_test.dart');

  final String val;

  ///
  const OutputFormats(this.val);
}

/// Using r'...' is a "raw" string,
/// so we don't interpret $lib$ as a field.
/// An alternative is escaping manually, or '\$lib\$'.
enum OIDir {
  /// toop level output folder .tmp_proto
  root(r'$package$'),
// r'$lib$':
  lib(r'$lib$'),

  ///.web
  web(r'$web$'),

  exportedProto('proto/messages.g.proto'),
  exportedLogs('proto/warnings.log');

  final String val;
  const OIDir(this.val);
}
