import 'package:d2p_annotation/d2p_annotation.dart';

@ProtoGen()
abstract class AbsFactories {
  const AbsFactories();
  // should be ignored
  const factory AbsFactories.private() = _PrivateClass;
  // should be ignored
  const factory AbsFactories.empty() = AbsEmptyClass;

  //
  const factory AbsFactories.first(String a, int b, bool c) = AbsSecond;
  const factory AbsFactories.second(String d) = AbsTherd;
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
