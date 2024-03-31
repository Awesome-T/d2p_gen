import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:typed_data';

import '../generated/proto/messages.g.pb.dart';
import '../models/auto.mp.dart';
import '../random_feilds.dart';

void main() async => runZonedGuarded(() async {
      await run();
    }, (e, t) {
      stderr.writeln('An error occurred. $e\n$t');
    });

Future<void> run() async {
  final rest = RestClient();
  // Send data in a loop
  for (var i = 0; i < 100; i++) {
    await Future.delayed(
      Duration(seconds: 1),
      () async {
        // Generate random car model data
        final data = randomCarModelDTO;
        // Encode data to Base64
        final _bytesData = base64.encode(data.writeToBuffer());

        if (i == 1) {
          // Send message in raw string format
          // const msg = 'Message into raw string format';
          // await rest.post(msg, '');
          // dev.log('REST_CLIENT: String sent: ${msg.runes.length}');
        }
        // ?
        else if (i % 2 == 0) {
          // // Send encoded data as JSON
          // final _str = jsonEncode({'CarModel': data.writeToBuffer()});
          // await rest.post(_str, 'car');
          // dev.log(
          //     'REST_CLIENT: Encoded JSON with bytes. Length: ${_str.runes.length}, Bytes: ${data.writeToBuffer().length}');
        } else if (i == 3) {
          // Send raw bytes
          // await rest.post(_bytesData, 'car');
          // dev.log('REST_CLIENT: Bytes sent. Length: ${data.writeToBuffer().length}');
        } else {
          // Send data via REST API
          // final _data = data.writeToJsonMap();
          // await rest.post(_data, 'car');
          // Send encoded data as JSON
          final _str = {'CarModel': data.writeToBuffer()};
          await rest.post(_str, 'car');
          dev.log(
              'REST_CLIENT: Encoded JSON with bytes: ${data.writeToBuffer().length}');
        }
      },
    );
  }
}

// REST Client class
class RestClient {
  ///
  Future<void> post(
    Object? data,
    String path,
  ) async {
    late final client = HttpClient();
    final request =
        await client.postUrl(Uri.parse('http://localhost:4041/$path'));

    late ContentType type;
    late int length;

    if (data is String) {
      type = ContentType.text;
      final _data = data;
      length = _data.runes.length;
      // Set request headers
      request.headers
          .set(HttpHeaders.contentTypeHeader.runes.string, type.mimeType);
      request.headers.set(HttpHeaders.contentLengthHeader.runes.string, length);
      request.write(_data);
    }
    //
    else if (data is Map<String, Uint8List> || data is Map<String, List<int>>) {
      type = ContentType.json;
      final _map = data as Map<String, Uint8List>;

      final _data = jsonEncode({
        _map.keys.first: base64.encode(
          _map.values.first,
        ),
      });

      length = _data.runes.length;

      // Set request headers
      request.headers
          .set(HttpHeaders.contentTypeHeader.runes.string, type.mimeType);
      request.headers.set(HttpHeaders.contentLengthHeader.runes.string, length);
      request.write(_data);
      dev.log('ContentType $type ${data.runtimeType}');

      // Send request and receive response
      final response = await request.close();

      // Decode response data
      final dataOfresponse = await utf8.decoder.bind(response).join();

      // await utf8.decoder.bind(response).asBroadcastStream().transform(json.decoder).first;

      // Log details of the response
      if (ContentType.parse(response.headers.contentType!.value) ==
          ContentType.binary.value) {
        final bytes = (dataOfresponse as List).cast<int>();
        dev.log('''
POST request was sent with:
- Bytes: $length
- Content Length: ${response.headers.contentLength}
- Content Type: ${response.headers.contentType}
- Parsed Car Model: ${$MapperCarModel.fromDTO(DTOCarModel.fromBuffer(bytes))}
''');
      }
    }
    //
    else if (data is List<int> || data is Uint8List) {
      type = ContentType.binary;
      final _data = utf8.encode(json.encode(data));
      length = _data.length;
      // Set request headers
      request.headers
          .set(HttpHeaders.contentTypeHeader.runes.string, type.mimeType);
      request.headers.set(HttpHeaders.contentLengthHeader.runes.string, length);
      request.add(_data);
    } else {
      type = ContentType.json;
      length = 0;
    }

    client.close();
  }
}

/**
//
  final json = <double>[];
  final map = <double>[];

  for (var q = 0; q <= 10; q++) {
    for (var i = 0; i <= 10000; i++) {
      final t = randomCarModelDTO;// randomAnimalDto;
      final d = jsonEncode(t.toProto3Json());
      final s = jsonEncode(t.writeToJsonMap());

      final f = t.writeToBuffer().length;
      // toProto3JsonVSByte
      final jsonVSByte = (d.runes.length / f) - 1;
      final mapVsByte = (s.runes.length / f) - 1;
      map.add(mapVsByte);
      json.add(jsonVSByte);
    }
//      stdout.writeln('''
// toProto3Json ${d.runes.length}
// writeToJsonMap ${s.runes.length}
// Uint8List $f
// toProto3Json vs Uint8List  $jsonVSByte
// writeToJsonMap vs Uint8List  $mapVsByte
// ''');
  }
  final avJson = ((json.reduce((value, element) => value + element) / json.length) * 100).toStringAsFixed(2);
  final avmap = ((map.reduce((value, element) => value + element) / json.length) * 100).toStringAsFixed(2);

  // }

//
   stdout.writeln('''
avJson $avJson
avmap $avmap
''');

// ? randomCarModelDTO
// avJson [80.90, 80.90, 80.90, 80.89, 80.87, 80.85, 80.84, 80.84, 80.85, 80.86, 80.84]
// avmap  [33.08, 33.08, 33.08, 33.08, 33.07, 33.06, 33.06, 33.06, 33.06, 33.07, 33.06]

// avJson 136.26
// avmap 84.29
//

 */
