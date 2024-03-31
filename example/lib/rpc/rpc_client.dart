import 'dart:developer';
import 'package:grpc/grpc.dart' as grpc;
import '../generated/proto/grpc_service.pbgrpc.dart';
import '../generated/proto/messages.g.pb.dart';
import '../models/auto.mp.dart';
import '../random_feilds.dart';

Future<void> main(List<String> args) async {
  final channel = grpc.ClientChannel(
    'localhost',
    port: 50051,
    options: const grpc.ChannelOptions(
      credentials: grpc.ChannelCredentials.insecure(),
    ),
  );

  try {
    await Future.delayed(Duration(seconds: 3));
    final DTOCarModel molel = randomCarModelDTO;

    final stub = AServiceClient(channel);
    await for (var response in stub.streamModels(Stream.value(molel))) {
      var _model = $MapperCarModel.fromDTO(response);

      log('''client received: 
modelName:${_model.modelName}
color:${_model.avalebleColors}
''');
    }
    await channel.shutdown();
  } catch (e) {
    throw Exception('Caught error: $e');
  }
  //
}
