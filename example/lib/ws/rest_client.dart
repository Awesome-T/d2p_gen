import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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
        if (i % 2 == 0) {
          // Generate random car model data and send it via REST API
          final car = randomCarModelDTO;
          await rest.run(car.writeToBuffer(), 'car');
        } else if (i % 3 == 0) {
          // Generate random animal data and send it via REST API
          final animal = randomAnimalDto;
          await rest.run(animal.writeToBuffer(), 'animals');
        } else {
          // For other iterations, no data is sent
        }
      },
    );
  }
}

// REST Client class
class RestClient {
  Future<void> run(Object? data, String path) async {
    final client = HttpClient();
    late ContentType type;
    late int length;
    late HttpClientResponse response;

    // Determine the type and length of the data to be sent
    if (data is String) {
      type = ContentType.text;
      final _data = data;
      length = _data.runes.length;
    } else if (data is Map) {
      type = ContentType.json;
      final _map = data as Map<String, dynamic>;
      final _data = jsonEncode({
        _map.keys.first: base64.encode((_map.values.first as List).cast<int>())
      });
      length = _data.runes.length;
    } else if (data is List<int> || data is Uint8List) {
      type = ContentType.binary;
      final _data = data as Uint8List;
      length = _data.length;
    } else {
      throw Exception('Unsupported data type');
    }

    // Create the HTTP request
    final request =
        await client.postUrl(Uri.parse('http://localhost:4041/$path'));
    request
      ..headers.set(HttpHeaders.contentTypeHeader.runes.string, type.mimeType)
      ..headers.set(HttpHeaders.contentLengthHeader.runes.string, length)
      ..write(data);

    // Send the request and receive the response
    response = await request.close();

    // Process the response based on its content type
    if (response.headers.contentType?.value == ContentType.binary.value) {
      final responseBody =
          await readData(response, response.headers.contentType!).byte;
      // Process binary response
      // Log details...
    } else {
      final responseBody =
          await readData(response, response.headers.contentType!).str;
      // Process text response
      // Log details...
    }

    client.close();
  }

  // Read data from HTTP response
  ({Future<String>? str, Future<List<int>>? byte}) readData(
      HttpClientResponse response, ContentType type) {
    if (type == ContentType.binary) {
      // Read binary data
      return (
        str: null,
        byte: response
            .fold<List<int>>(<int>[], (bytes, chunk) => bytes..addAll(chunk))
      );
    } else {
      // Read text data
      return (str: response.transform(utf8.decoder).join(), byte: null);
    }
  }
}

// List of HTTP error codes
final List<int> httpErrorsCodes = [
  200,
  201,
  204,
  400,
  401,
  403,
  404,
  405,
  500,
  502,
  503
];
