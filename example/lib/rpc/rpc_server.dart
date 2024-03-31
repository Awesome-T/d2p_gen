import 'dart:developer';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:grpc/service_api.dart';
import 'package:protobuf/protobuf.dart';

import '../generated/proto/grpc_service.pbgrpc.dart';
import '../generated/proto/messages.g.pb.dart';
import '../models/auto.mp.dart';
import '../random_feilds.dart';

Future<void> main(List<String> args) async {
  // await server.serve(port: 50051);
  // log('Server listening on port ${server.port}...');
  final udsAddress = InternetAddress(
    'localhost',
    type: InternetAddressType.unix,
  );
  final server = Server.create(
    services: [
      _AServerService(),
    ],
    errorHandler: (GrpcError error, trace) {
      // error.
      throw error;
    },
    interceptors: [],
    codecRegistry: CodecRegistry(
      codecs: const [
        GzipCodec(),
        IdentityCodec(),
      ],
    ),
  );
  await server.serve(
    //   address: udsAddress,
    port: 50051,
    //  http2ServerSettings:ServerSettings()
  );

  log('Start UNIX Server @localhost...');
}

///
class _AServerService extends AServiceBase {
  @override
  Stream<DTOCarModel> streamModels(
    ServiceCall call,
    Stream<DTOCarModel> stream,
  ) async* {
    await for (final request in stream) {
      if (!call.headers!.containsKey('type')) {
        call.headers!.addAll({'type': 'fdfvf'});
      }
      stdout.writeln('${call.headers!}');

      for (var i = 0; i < 9; i++) {
        var _model = $MapperCarModel.fromDTO(request);

        log('''client received: 
modelName:${_model.modelName}
color:${_model.avalebleColors}
''');
        if (i % 3 == true) {
          yield randomCarModelDTO;
        } else {
          yield request;
        }
        await Future.delayed(const Duration(seconds: 3));
      }
    }
  }
}
