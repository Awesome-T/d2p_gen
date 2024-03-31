import 'dart:developer' as dev;
import 'package:grpc/grpc.dart' as grpc;
import '../generated/proto/grpc_service.pbgrpc.dart';
import '../models/auto.mp.dart';
import '../random_feilds.dart';

Future<void> main(List<String> args) async {
  // Establishing a gRPC client channel
  final channel = grpc.ClientChannel(
    'localhost',
    port: 50051,
    options: const grpc.ChannelOptions(
      credentials: grpc.ChannelCredentials.insecure(),
    ),
  );

  try {
    // Adding a delay for demonstration purposes
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(Duration(seconds: 3));

    // Generating a random car model DTO
    final model = randomCarModelDTO;

    // Creating a gRPC client stub
    final stub = AServiceClient(channel);

    // Streaming the model to the server and receiving responses asynchronously
    await for (var response in stub.streamModels(Stream.value(model))) {
      // Converting the received DTO response to a model object
      final _model = $MapperCarModel.fromDTO(response);

      // Logging the received model details
      dev.log('''Client received: 
Model name: ${_model.modelName}
Available colors: ${_model.avalebleColors}
''');
    }

    // Shutting down the gRPC client channel
    await channel.shutdown();
  } catch (e) {
    // Handling any errors that occur during execution
    throw Exception('Caught error: $e');
  }
}
