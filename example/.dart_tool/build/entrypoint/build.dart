// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:source_gen/builder.dart' as _i2;
import 'package:freezed/builder.dart' as _i3;
import 'package:d2p_gen/d2p_gen.dart' as _i4;
import 'package:build_config/build_config.dart' as _i5;
import 'package:build_resolvers/builder.dart' as _i6;
import 'dart:isolate' as _i7;
import 'package:build_runner/build_runner.dart' as _i8;
import 'dart:io' as _i9;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'source_gen:combining_builder',
    [_i2.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'freezed:freezed',
    [_i3.freezed],
    _i1.toDependentsOf(r'freezed'),
    hideOutput: false,
  ),
  _i1.apply(
    r'd2p_gen:tmpProto',
    [_i4.tmpProto],
    _i1.toDependentsOf(r'd2p_gen'),
    hideOutput: true,
    defaultGenerateFor: const _i5.InputSet(
      include: [
        r'lib/**.dart',
        r'src/**.dart',
      ],
      exclude: [r'.freezed.dart'],
    ),
  ),
  _i1.apply(
    r'd2p_gen:finalizerProto',
    [_i4.finalizerProto],
    _i1.toDependentsOf(r'd2p_gen'),
    hideOutput: false,
  ),
  _i1.apply(
    r'd2p_gen:protocRunner',
    [_i4.protocRunner],
    _i1.toDependentsOf(r'd2p_gen'),
    hideOutput: true,
  ),
  _i1.apply(
    r'd2p_gen:tmpMapper',
    [_i4.tmpMapper],
    _i1.toRoot(),
    hideOutput: false,
  ),
  _i1.apply(
    r'd2p_gen:testBuildet',
    [_i4.testBuildet],
    _i1.toDependentsOf(r'd2p_gen'),
    hideOutput: false,
    defaultGenerateFor: const _i5.InputSet(
      include: [r'lib/**.dart'],
      exclude: [r'.freezed.dart'],
    ),
  ),
  _i1.apply(
    r'd2p_gen:sbuilder',
    [_i4.sbuilder],
    _i1.toDependentsOf(r'd2p_gen'),
    hideOutput: false,
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i6.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_resolvers:transitive_digest_cleanup'],
  ),
  _i1.applyPostProcess(
    r'build_resolvers:transitive_digest_cleanup',
    _i6.transitiveDigestCleanup,
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i2.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i7.SendPort? sendPort,
]) async {
  var result = await _i8.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i9.exitCode = result;
}
