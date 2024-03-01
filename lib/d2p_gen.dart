import 'package:build/build.dart';
import 'src/builders/d2p_mapper.dart';
import 'src/builders/d2p_protoc_runner.dart';
import 'src/builders/d2p_tmp.dart';
import 'src/builders/d2p_unioner.dart';

// protoc --dart_out=grpc:lib/src/generated **/*.proto
/// [D2pTmpBuilder]
Builder d2pTmpBuilder(BuilderOptions _) => D2pTmpBuilder();

/// [D2pUnionBuilder]
Builder d2pUnionBuilder(BuilderOptions _) => D2pUnionBuilder(_);

/// [D2PMapperBuilder]
Builder d2pMapperBuilder(BuilderOptions _) => D2PMapperBuilder(_);

///
Builder ptotocRunner(BuilderOptions _) => PtotocRunner(_);
