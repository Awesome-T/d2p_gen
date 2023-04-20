final String header = '''
syntax = "proto3";
package messages;
// option go_package = "messages";
// option php_namespace = "protoc\messages";
// option php_metadata_namespace = "messages";
// option java_package = "io.grpc.gen.messages";
// option java_outer_classname = "messages";
option java_multiple_files = true;
// [END java_declaration]
// [SPEED,CODE_SIZE,LITE_RUNTIME]
option optimize_for = SPEED;
// This file relies on plugins to generate service code.
option cc_generic_services = false;
option java_generic_services = false;
option py_generic_services = false;
// [START csharp_declaration]
// option csharp_namespace = "Google.Protobuf.Examples.AddressBook";
// [END csharp_declaration]
// [START go_declaration]
// option go_package = "github.com/protocolbuffers/protobuf/examples/go/tutorialpb";
// [END go_declaration]
// [START declaration]
// import "google/protobuf/timestamp.proto";
// import "google/protobuf/any.proto";
// import "google/protobuf/descriptor.proto";
// import "google/protobuf/timestamp.proto";
// import "google/protobuf/timestamp.proto";
// [END declaration]
// 
// To get an in-depth walkthrough of this file and the related examples, see:
// https://developers.google.com/protocol-buffers/docs/tutorials
//                               DATA TYPES
//                           proto3   |   Dart
// **************************************************************************
//                           double   |   double
//                           Int64    |   int
//                           bool     |   bool
//                           string   |   String
//                           string   |   Map
//                           enum     |   enum
//                           repeated |   Iterables
// **************************************************************************
// Generated At at ${DateTime.now().toUtc()}
//
//''';

/// outputs must be unique across all builders.
enum OutputFormats {
/**
  .tmp_proto extinsion for files
  wich'll be export to a separeted fise
  .dart:
        - .u_tmp_proto
        - .tmp_proto
*/
  tmpProto('.tmp_proto'),
/**
  extinsion for files
  .freezed.dart:
        - .freezed.tmp_proto
*/
  tmpFreezedProto('.freezed.tmp_proto'),

  ///[.log]
  logOut('.log'),

  ///[.tmp_log]
  tmpLog('.tmp_log'),

  ///.u_tmp_proto extinsion for files
  /// wich'll be export to a single fise
  // tmpUniomProto('.u_tmp_proto'),
  dart('.dart'),

  ///.g.proto
  gProto('.g.proto'),

  ///.proto
  proto('.proto'),

  ///[.mapper.dart]
  mapperDart('.mapper.dart');

  ///[.g.dart]
  // gDart('.g.dart');

  final String val;
  const OutputFormats(this.val);
}

///
const Map<String, List<String>> buildExtensions = {
  r'$package$': ['proto/exports.proto']
};

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

  exportedProto('proto/messages.proto'),
  exportedLogs('proto/warnings.log');

  final String val;
  const OIDir(this.val);
}
