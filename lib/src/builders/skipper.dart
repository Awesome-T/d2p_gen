import 'dart:async';

import 'package:build/build.dart';

import '../unils/extensions.dart';
import '../unils/header.dart';

/// This builder does nothing but wait for all markers
/// to be generated and a temporary file to be received.
/// The key is specified in the `build.yaml` file.
/// After that, the test builder will run and get
/// all .mp.dart files.
base class EmptyBuilder extends Builder with ValueReader {
  @override
  FutureOr<void> build(final BuildStep buildStep) {}

  @override
  Map<String, List<String>> get buildExtensions => {
        OutputFormats.mapperCreated.val: ['.skip']
      };
}
