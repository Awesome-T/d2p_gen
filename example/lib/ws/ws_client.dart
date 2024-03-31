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
///
Future<void> run() async {
  // Connect to WebSocket server
  final ws = await WebSocket.connect('ws://localhost:4041');
  ws.listen(
    (data) async {
      // Check the type of RECIVED data
      if (data is List<int>) {
        dev.log('WS_CLIENT: RECIVED bytes: ${data.length}');
      } else {
        final msg = data as String;
        if (data.startsWith('{') && data.endsWith('}')) {
          final map = jsonDecode(msg);
          if (map is Map) {
            final _map = map;
            if (_map.containsKey('CarModel')) {
              final bytes = (_map.values.first as List).cast<int>();
              final _dto = DTOCarModel.fromBuffer(bytes);
              final _model = $MapperCarModel.fromDTO(_dto);
              dev.log(
                  '''WS_CLIENT: RECIVED bytes of wich converter into `${_model.runtimeType}`  ${bytes.length}''');
            }
            //
            if (_map.containsKey('Animal')) {
              final bytes = (_map.values.first as List).cast<int>();
              final _dto = DTOAnimal_Union.fromBuffer(bytes);
              final _model = $MapperAnimal.fromDTO(_dto);
              dev.log(
                  '''WS_CLIENT: RECIVED bytes of wich converter into `${_model.runtimeType}`  ${bytes.length}''');
            }
            if (_map.containsKey('FreezedCl')) {
//
              final _newMsg = 'New Messege sended at ${DateTime.now()}';
              ws.add(_newMsg);
            }
            dev.log('''WS_CLIENT: RECIVED ecvoded a Map: ${map.keys.first}''');
          }
        }
        //
        else {
          dev.log('''WS_CLIENT: RECIVED String data : $msg''');
        }
      }
    },
    onDone: () => dev.log('WebSocket connection closed'),
    onError: (error) => dev.log('WS_CLIENT: WebSocket error: $error'),
  );

  // Send data in a loop
  for (var i = 0; i < 1000; i++) {
    await Future.delayed(
      Duration(seconds: 2),
      () async {
        // Generate random car model data
        final data = randomCarModelDTO;

        // Encode data to Base64
        base64.encode(data.writeToBuffer());

        if (i % 5 == 0) {
          // Send message in raw string format
          const msg = 'Message into raw string format';
          ws.add(msg);
          dev.log('WS_CLIENT: String sent: ${msg.runes.length}');
        } else if (i % 4 == 0) {
          // Send encoded data as JSON
          final _str = jsonEncode({'CarModel': data.writeToBuffer()});
          ws.add(_str);
          dev.log(
              'WS_CLIENT: Encoded JSON with bytes. Length: ${_str.runes.length}, Bytes: ${data.writeToBuffer().length}');
        } else if (i % 3 == 0) {
          // Send raw bytes
          ws.add(data.writeToBuffer());
          dev.log(
              'WS_CLIENT: Bytes sent. Length: ${data.writeToBuffer().length}');
        } else {
          // Send data via REST API
          final _data = data.writeToJsonMap();
          //await rest.run(_data);
        }
      },
    );
  }
}
