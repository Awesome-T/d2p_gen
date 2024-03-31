import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../generated/proto/messages.g.pb.dart';
import '../models/auto.mp.dart';
import '../models/sealeds.mp.dart';
import '../random_feilds.dart';

void main() async => runZonedGuarded(() async => run(), (final e, final t) {
      stderr.writeln('An error occurred: $e\n$t');
    });

///
Future<void> run() async {
  // Start HTTP server
  final server = await HttpServer.bind('localhost', 4041);
  log('Server is serving on ${server.address}:${server.port}');

  try {
    await for (HttpRequest request in server.asBroadcastStream()) {
      switch (request.method) {
        case 'GET':
          if (WebSocketTransformer.isUpgradeRequest(request)) {
            await handleWebSocket(request);
          } else {
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

///
Future<void> handleWebSocket(final HttpRequest request) async =>
    WebSocketTransformer.upgrade(request).then(
      (final ws) => ws.listen(
        (final data) async {
          final _rCarModelDto = randomCarModelDTO;
          if (data is List<int>) {
            await Future.delayed(Duration(seconds: 1), () {
              ws.add(_rCarModelDto.writeToBuffer());
              log('SERVER: Received data as bytes: ${data.length}');
            });
          } else {
            final msg = data as String;
            if (msg.startsWith('{') && msg.endsWith('}')) {
              final map = jsonDecode(msg);
              if (map is Map) {
                final _map = map;
                if (_map.containsKey('CarModel')) {
                  final bytes = (_map.values.first as List).cast<int>();
                  final _dto = DTOCarModel.fromBuffer(bytes);
                  final _model = $MapperCarModel.fromDTO(_dto);
                  log('SERVER: Received bytes which converted into `${_model.runtimeType}` ${bytes.length}');
                  await Future.delayed(Duration(milliseconds: 500), () {
                    final _str =
                        jsonEncode({'Animal': randomAnimalDto.writeToBuffer()});
                    ws.add(_str);
                  });
                }
                if (_map.containsKey('Animal')) {
                  final bytes = (_map.values.first as List).cast<int>();
                  final _dto = DTOAnimal_Union.fromBuffer(bytes);
                  final _model = $MapperAnimal.fromDTO(_dto);
                  log('SERVER: Received bytes which converted into `${_model.runtimeType}` ${bytes.length}');
                  await Future.delayed(Duration(seconds: 3), () {
                    final _str = jsonEncode(
                        {'CarModel': randomCarModelDTO.writeToBuffer()});
                    ws.add(_str);
                  });
                }
              }
            } else {
              log('SERVER: Received data as String: $msg');
              await Future.delayed(Duration(milliseconds: 1900), () {
                final _newMsg = 'New Message sent at ${DateTime.now()}';
                ws.add(_newMsg);
              });
            }
          }
        },
        onDone: () => log('WebSocket connection closed'),
        onError: (final error) => log('WebSocket error: $error'),
      ),
    );

///
Future<void> handlePost(final HttpRequest request) async {
  try {
    if (request.headers.contentType != null) {
      if (request.uri.path == '/animals') {
        if (request.headers.contentType == ContentType.binary) {
          // final decoded = await utf8.decoder.bind(request).asBroadcastStream().transform(json.decoder).first;
          final newDto = randomAnimalDto;
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.contentType = ContentType.binary
            ..headers.contentLength = newDto.writeToBuffer().length
            ..write(jsonEncode(newDto.writeToJsonMap()));
          await request.response.close();
        } else if (request.headers.contentType == ContentType.json) {
          final newDto = randomAnimalDto;
          final json = jsonEncode(newDto.writeToJsonMap());
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.contentType = ContentType.json
            ..headers.contentLength = json.length
            ..write(json);
          await request.response.close();
          log('SERVER: DTO model: ${newDto.runtimeType}');
        }
      } else if (request.uri.path == '/car') {
        final newDto = randomCarModelDTO;
        if (request.headers.contentType?.value == ContentType.binary.value) {
          request.response
            ..statusCode = HttpStatus.ok
            ..headers.contentType = ContentType.binary
            ..headers.contentLength = newDto.writeToBuffer().length
            ..add(newDto.writeToBuffer())
            ..close();
          log('SERVER: path: ${request.uri.path}, contentType: ${request.headers.contentType?.value} contentLength: ${request.headers.contentLength}');
        }
        if (request.headers.contentType?.value == ContentType.json.value) {
          // final decoded = await utf8.decoder.bind(request).asBroadcastStream().transform(json.decoder).first;
          request.response.headers.contentType = ContentType.json;
          request.response.statusCode = HttpStatus.ok;
          request.response.write(jsonEncode(newDto.writeToJsonMap()));
          await request.response.close();
          log('SERVER: DTO model: ${newDto.runtimeType}');
        }
      } else {
        request.response
          ..statusCode = HttpStatus.notFound
          ..headers.add('Location', '/not_found')
          ..write('404 Not Found')
          ..close();
      }
    } else {
      request.response
        ..statusCode = HttpStatus.badRequest
        ..headers.contentType = ContentType.text
        ..write('Bad Request: Invalid or incomplete request.')
        ..close();
    }
  } catch (e) {
    log('Error handling POST request: $e');
    return;
  }
}

///
Future<void> handleGet(final HttpRequest request) async {
  try {
    final response = request.response;
    response.statusCode = HttpStatus.ok;
    response.headers.contentType = ContentType.text;
    response.write('Hello, world!');
    await response.close();
  } catch (e) {
    log('Error handling GET request: $e');
    return;
  }
}
