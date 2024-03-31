import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:typed_data';

import '../generated/proto/messages.g.pb.dart';
import '../models/auto.mp.dart';
import '../random_feilds.dart';

void main() async => runZonedGuarded(() async => run(), (e, t) {
      stderr.writeln('An error occurred. $e\n$t');
    });

Future<void> run() async {
  final rest = RestClient();
  // Send data in a loop
  for (var i = 0; i < 100; i++) {
    await Future.delayed(
      Duration(seconds: 2),
      () async {
        // final _data = data.writeToBuffer();
        // await rest.run(_data, 'car');
        if (i % 2 == 0) {
          // Generate random car model data
          final car = randomCarModelDTO;
          // Encode data to Base64

          // Send encoded data as JSON
          //  final _str = jsonEncode({'CarModel': _bytesData});
          await rest.run(car.writeToBuffer(), 'car');
        } else if (i % 3 == 0) {
          //
          final animal = randomAnimalDto;
          animal;
          await rest.run(animal.writeToBuffer(), 'animals');
        } else {
          //      // Generate random car model data
          final car = randomCarModelDTO;
          //   stdout.writeln('CarModel $i');
          // Send data via REST API
          // final _data = data.writeToJsonMap();
          // final _data = data.writeToBuffer();
          // await rest.run(_data, 'car');
        }
      },
    );
  }
}

// REST Client class
class RestClient {
  ///
  Future<void> run(Object? data, String path) async {
    final client = HttpClient();
    final request =
        await client.postUrl(Uri.parse('http://localhost:4041/$path'));
//``

    late ContentType type;
    late int length;
    late HttpClientResponse response;

    if (data is String) {
      type = ContentType.text;
      final _data = data;
      length = _data.runes.length;

      // Set request headers
      request
        ..headers.set('${HttpHeaders.contentTypeHeader}', '${ContentType.text}')
        ..headers.set(HttpHeaders.contentLengthHeader.runes.string, length)
        ..write(_data);
      dev.log('$path ${data.runtimeType}');
      // Send request and receive response
      response = await request.close();

      if (!httpErrorsCodes.contains(response.statusCode)) {
        final dataOfresponse =
            await readData(response, response.headers.contentType!).str;
        dev.log('$dataOfresponse');
      }
      //
      else {
        // Читаем данные ответа
        final responseBody =
            await readData(response, response.headers.contentType!).str;
        //await response.transform(utf8.decoder).join();
        dev.log('${response.statusCode} $responseBody');
      }
      client.close();
    }
    //
    else if (data is Map) {
      type = ContentType.json;
      final _map = data as Map<String, dynamic>;

      // final _bytesData = base64.encode(data.writeToBuffer());
      final _data = jsonEncode({
        _map.keys.first: base64.encode((_map.values.first as List).cast<int>())
      });

      length = _data.runes.length;
      // Set request headers
      request
        ..headers.set(HttpHeaders.contentTypeHeader.runes.string, type.mimeType)
        ..headers.set(HttpHeaders.contentLengthHeader.runes.string, length)
        ..write(_data);

      // Send request and receive response
      response = await request.close();
      await readData(response, response.headers.contentType!).str;
      dev.log('ContentType $path ${data.runtimeType} ${request.headers}');
    }
    //
    else if (data is List<int> || data is Uint8List) {
      type = ContentType.binary;
      final _data = data as Uint8List;
      length = _data.length;
      request
        ..headers.set(HttpHeaders.contentTypeHeader.runes.string, type.mimeType)
        ..headers.set(HttpHeaders.contentLengthHeader.runes.string, length)
        ..add(_data);
      response = await request.close();
      if (response.statusCode == 200) {
        //   if (!httpErrorsCodes.contains(response.statusCode)) {
        final responseBody =
            await readData(response, response.headers.contentType!).byte;
        if (request.uri.pathSegments.last == 'car') {
          final model =
              $MapperCarModel.fromDTO(DTOCarModel.fromBuffer(responseBody!));
          dev.log(
              '''responde as byte from: /${request.uri.pathSegments.last}, length ${response.headers.contentLength} ${model.runtimeType}''');
        } else {}
      }
      //
      else {
        if (response.headers.contentType?.value == ContentType.binary.value) {
          //
        }
        //           final bytes = (dataOfresponse as List).cast<int>();
// dev.log('''
// POST request was sent with:
// - Bytes: ${utf8.encode(json.encode(_data)).length}
// - Content Length: ${response.headers.contentLength}
// - Content Type: ${response.headers.contentType}
// ''');
      }
    }
    //
    else {
      throw Exception();
    }

    // // Decode response data
    // final dataOfresponse = await utf8.decoder.bind(response).asBroadcastStream().join();

    // if (!httpErrorsCodes.contains(response.statusCode)) {
    //   //(response.statusCode == HttpStatus.ok) {
    //   // Decode response data
    //   //  final dataOfresponse = await utf8.decoder.bind(response).asBroadcastStream().transform(json.decoder).first;
    //   dev.log('$dataOfresponse');
    // }
    // //
    // else {
    //   // Читаем данные ответа
    //   //   final responseBody = await response.asBroadcastStream().transform(utf8.decoder).join();
    //   dev.log('${response.statusCode} $dataOfresponse');
    // }

    // await utf8.decoder.bind(response).asBroadcastStream().transform(json.decoder).first;

    // Log details of the response
    // if (ContentType.parse(response.headers.contentType!.value) == ContentType.binary.value) {
    //   final bytes = (dataOfresponse as List).cast<int>();
    // }
    client.close();
  }

  ///
  ///
  ({Future<String>? str, Future<List<int>>? byte}) readData(
      HttpClientResponse response, ContentType type) {
    if (response.headers.contentType?.value == ContentType.binary.value) {
      //   utf8.decoder.bind(response).asBroadcastStream().transform(json.decoder).first
      return (
        str: null,
        byte: response
            .fold<List<int>>(<int>[], (bytes, chunk) => bytes..addAll(chunk))
      );
    } else {
      return (str: response.transform(utf8.decoder).join(), byte: null);
    }
  }
  //
}

///
final List<int> httpErrorsCodes = [
  200, // OK
  201, // Created
  204, // No Content
  400, // Bad Request
  401, // Unauthorized
  403, // Forbidden
  404, // Not Found
  405, // Method Not Allowed
  500, // Internal Server Error
  502, // Bad Gateway
  503, // Service Unavailable
];
