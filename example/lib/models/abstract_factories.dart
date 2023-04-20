// ignore_for_file: public_member_api_docs

import 'package:d2p_annotation/dart_to_proto_annotations.dart';

//protoGen
@ProtoGen(createMappers: true)
abstract class AbsFactories {
  const AbsFactories();
  const factory AbsFactories.empty() = AbsEmptyClass;
  const factory AbsFactories.first(String a, int b, bool c) = AbsSecond;
  const factory AbsFactories.second(String d) = AbsTherd;
  const factory AbsFactories.private() = _PrivateClass;
}

class AbsEmptyClass extends AbsFactories {
  const AbsEmptyClass();
}

class AbsSecond extends AbsFactories {
  const AbsSecond(this.a, this.b, this.c);
  final String a;
  final int b;
  final bool c;
}

class AbsTherd extends AbsFactories {
  const AbsTherd(this.d);
  final String d;
}

class _PrivateClass extends AbsFactories {
  const _PrivateClass();
}
