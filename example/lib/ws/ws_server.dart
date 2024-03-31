import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import '../generated/proto/messages.g.pb.dart';
import '../models/auto.mp.dart';
import '../models/sealeds.mp.dart';
import '../random_feilds.dart';

void main() async => runZonedGuarded(() async => run(), (e, t) {
      stderr.writeln('An error occurred. $e\n$t');
    });

///
Future<void> run() async {
  // Bind server to a port
  final server = await HttpServer.bind('localhost', 4041);
  dev.log('SERVER is serving on ${server.address}:${server.port}');

  // Listen for incoming HTTP requests
  try {
    await for (HttpRequest request in server.asBroadcastStream()) {
      //    dev.log('''Request at: ${request.uri}, Method: ${request.method}, Length: ${request.headers.contentLength}''');
      switch (request.method) {
        case 'GET':
          // Handle WebSocket upgrade request
          // method `GET`
          // request.headers[HttpHeaders.connectionHeader] `upgrade`
          if (WebSocketTransformer.isUpgradeRequest(request)) {
            await handleWebSocket(request);
          }
          //
          else {
            await handleGet(request);
          }
        case 'POST':
          await handlePost(request);
      }
    }
  } on Exception catch (e) {
    throw Exception(e);
  } finally {
    await server.close();
  }
}

/// Handle WebSocket upgrade request
Future<void> handleWebSocket(HttpRequest request) async =>
    // Upgrade the HTTP request to a WebSocket connection
    WebSocketTransformer.upgrade(request).then(
      (WebSocket ws) => ws.listen(
        (data) async {
          // Generate random car model data
          final _rCarModelDto = randomCarModelDTO;
          //
          if (data is List<int>) {
            // Handle data as bytes
            await Future.delayed(Duration(seconds: 1), () {
              ws.add(_rCarModelDto.writeToBuffer());
              dev.log('''SERVER: RECIVED Data is bytes: ${data.length}''');
            });
          }
          //
          else {
            // Handle data as string
            final msg = data as String;
            if (msg.startsWith('{') && msg.endsWith('}')) {
              final map = jsonDecode(msg);
              if (map is Map) {
                final _map = map;

                //
                if (_map.containsKey('CarModel')) {
                  final bytes = (_map.values.first as List).cast<int>();
                  final _dto = DTOCarModel.fromBuffer(bytes);
                  final _model = $MapperCarModel.fromDTO(_dto);
                  //send another model
                  dev.log(
                      '''SERVER: RECIVED bytes of wich converter into `${_model.runtimeType}`  ${bytes.length}''');

                  await Future.delayed(Duration(milliseconds: 500), () {
                    final _str =
                        jsonEncode({'Animal': randomAnimalDto.writeToBuffer()});
                    ws.add(_str);
                  });
                }

                //
                if (_map.containsKey('Animal')) {
                  final bytes = (_map.values.first as List).cast<int>();
                  final _dto = DTOAnimal_Union.fromBuffer(bytes);
                  final _model = $MapperAnimal.fromDTO(_dto);

                  dev.log(
                      '''SERVER: RECIVED bytes of wich converter into `${_model.runtimeType}`  ${bytes.length}''');
                  //
                  await Future.delayed(Duration(seconds: 3), () {
                    final _str = jsonEncode(
                        {'CarModel': randomCarModelDTO.writeToBuffer()});
                    ws.add(_str);
                  });
                }
                //  dev.log('''SERVER: RECIVED Data as Map: ${map.keys.first}''');
              }
            } else {
              dev.log('''SERVER: RECIVED data as String: $msg''');
              await Future.delayed(Duration(milliseconds: 1900), () {
                final _newMsg = 'New Messege sended at ${DateTime.now()}';
                ws.add(_newMsg);
              });
            }
          }
        },
        onDone: () => dev.log('WebSocket connection closed'),
        onError: (error) => dev.log('WebSocket error:'),
      ),
    );

/// Handle POST request
Future<void> handlePost(HttpRequest request) async {
  try {
    if (request.headers.contentType != null) {
      if (request.uri.path == '/animals') {
        if (request.headers.contentType == ContentType.binary) {
          final decoded = await utf8.decoder
              .bind(request)
              .asBroadcastStream()
              .transform(json.decoder)
              .first;
          //
          final newDto = randomAnimalDto; // Generate new DTO data
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.set(HttpHeaders.contentLengthHeader.runes.string,
                ContentType.binary.value)
            ..write(jsonEncode(newDto.writeToJsonMap()));
          await request.response.close();
          //   dev.log('SERVER: DTO model: ${newDto.runtimeType}');
        } else if (request.headers.contentType == ContentType.json) {
          final newDto = randomAnimalDto; // Generate new DTO data
          final json = jsonEncode(newDto.writeToJsonMap());
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.set(HttpHeaders.contentLengthHeader.runes.string,
                json.length.toString())
            ..headers.set(HttpHeaders.contentLengthHeader.runes.string,
                ContentType.json.value)
            ..write(json);
          await request.response.close();
          dev.log('SERVER: DTO model: ${newDto.runtimeType}');
        }
      }
      //
      else if (request.uri.path == '/car') {
        final newDto = randomCarModelDTO;
        if (request.headers.contentType?.value == ContentType.binary.value) {
          // Set response headers
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.set(HttpHeaders.contentTypeHeader.runes.string,
                ContentType.binary.value)
            ..headers.set(HttpHeaders.contentLengthHeader.runes.string,
                newDto.writeToBuffer().length)
            ..add(newDto.writeToBuffer())
            ..close();
          dev.log(
              'SERVER: path: ${request.uri.path}, contentType: ${request.headers.contentType?.value} contentLength: ${request.headers.contentLength}');
        }
        //  dev.log(' request.headers.contentType ${request.headers.contentType?.value} ${ ContentType.json.value}');
        if (request.headers.contentType?.value == ContentType.json.value) {
          dev.log(
              '''Request at: ${request.uri}, Method: ${request.method}, headers ${request.headers}''');
          final decoded = await utf8.decoder
              .bind(request)
              .asBroadcastStream()
              .transform(json.decoder)
              .first;
          // Set response headers
          request.response.headers.contentType = ContentType.json;
          request.response.statusCode = HttpStatus.ok;
          // Write response data

          request.response.write(jsonEncode(newDto.writeToJsonMap()));
          // Close the response
          await request.response.close();
          dev.log('SERVER: DTO model: ${newDto.runtimeType}');
        }
      }
      //
      else {
        request.response
          ..statusCode = HttpStatus.notFound
          ..headers.set('Location', '/not_found')
          ..write('404 Not Found')
          ..close();

        //
        // // Process the decoded data
        // final ttt = decoded as Map;
        // final dto = DTOCarModel.fromJson(jsonEncode(ttt));
        // final model = $MapperCarModel.fromDTO(dto);
        // // Generate new DTO data
        // final newDto = randomCarModelDTO;

        // // Set response headers
        // request.response.statusCode = HttpStatus.ok;
        // request.response.headers.contentType = ContentType.binary;
        // // Write response data
        // request.response.write(newDto.writeToBuffer());

        // // Close the response
        // await request.response.close();
        // dev.log('SERVER: DTO model: ${newDto.modelName}');
      }
    }
    //
    else {
      request.response
        ..statusCode = HttpStatus.badRequest
        ..headers.contentType = ContentType.text
        ..write('Bad Request: Invalid or incomplete request.')
        ..close();
    }

    // Decode the request data
    // final decoded = await utf8.decoder.bind(request).asBroadcastStream().transform(json.decoder).first;
    // if (request.uri.path == '/testing') {
    // } else {
    //   // Process the decoded data
    //   final ttt = decoded as Map;
    //   final dto = DTOCarModel.fromJson(jsonEncode(ttt));
    //   final model = $MapperCarModel.fromDTO(dto);

    //   // Generate new DTO data
    //   final newDto = randomCarModelDTO;

    //   // Set response headers
    //   request.response.statusCode = HttpStatus.ok;
    //   request.response.headers.contentType = ContentType.binary;

    //   // Write response data
    //   request.response.write(newDto.writeToBuffer());

    //   // Close the response
    //   await request.response.close();

    //   // Log details
    //   // dev.log('SERVER: Received model: ${model.modelName}');
    //   dev.log('SERVER: DTO model: ${newDto.modelName}');
    //   //  dev.log('DTOs are different: ${dto.hashCode != newDto.hashCode}');
    // }
  } catch (e) {
    dev.log('Error handling POST request: $e');
    return;
  }
}

/// Handle GET request
Future<void> handleGet(HttpRequest request) async {
  try {
    // Handle GET requests here
    final response = request.response;
    response.statusCode = HttpStatus.ok;
    response.headers.contentType = ContentType.text;
    response.write('Hello, world!');
    await response.close();
  } catch (e) {
    dev.log('Error handling GET request: $e');
    return;
  }
}

// Handle OPTIONS request
void handleOptions(HttpRequest request) {
  final response = request.response;
  addCorsHeaders(response);
  dev.log('OPTIONS: ${request.uri.path}');
  response
    ..statusCode = HttpStatus.noContent
    ..close();
}

// Add CORS headers to the response
void addCorsHeaders(HttpResponse response) {
  response.headers.add('Access-Control-Allow-Origin', '*');
  response.headers.add('Access-Control-Allow-Methods', 'POST, GET, OPTIONS');
  response.headers.add('Access-Control-Allow-Headers',
      'Origin, X-Requested-With, Content-Type, Accept');
}
