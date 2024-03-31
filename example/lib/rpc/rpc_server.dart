import 'dart:developer' as dev;
import 'dart:io';

import 'package:grpc/grpc.dart';

import '../generated/proto/grpc_service.pbgrpc.dart';
import '../generated/proto/messages.g.pb.dart';
import '../models/auto.mp.dart';
import '../random_feilds.dart';

Future<void> main(List<String> args) async {
  // Creating a gRPC server instance
  final server = Server.create(
    services: [
      _AServerService(),
    ],
    errorHandler: (GrpcError error, trace) {
      throw error; // Handling any errors during server operation
    },
    interceptors: [],
    codecRegistry: CodecRegistry(
      codecs: const [
        GzipCodec(),
        IdentityCodec(),
      ],
    ),
  );

  // Serving the gRPC server
  await server.serve(
    port: 50051,
  );

  // Logging server start message
  dev.log('Server started at port 50051...');
}

// gRPC service implementation
class _AServerService extends AServiceBase {
  @override
  Stream<DTOCarModel> streamModels(
    ServiceCall call,
    Stream<DTOCarModel> stream,
  ) async* {
    // Handling incoming stream of DTOCarModel objects
    await for (final request in stream) {
      // Adding custom header to the gRPC call if not already present
      if (!call.headers!.containsKey('type')) {
        call.headers!.addAll({'type': 'fdfvf'});
      }

      // Logging headers received with the call
      stdout.writeln('${call.headers!}');

      // Iterating over the stream and processing each DTOCarModel object
      for (var i = 0; i < 9; i++) {
        final _model = $MapperCarModel.fromDTO(request);

        // Logging received model details
        dev.log('''Client received: 
Model name: ${_model.modelName}
Available colors: ${_model.avalebleColors}
''');

        // Yielding a random DTOCarModel object every third iteration
        if (i % 3 == true) {
          yield randomCarModelDTO;
        } else {
          yield request;
        }

        // Adding a delay for demonstration purposes
        // ignore: inference_failure_on_instance_creation
        await Future.delayed(const Duration(seconds: 3));
      }
    }
  }
}
