// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:d2p_annotation/d2p_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fr_union.freezed.dart';

@ProtoGen(createMappers: true)
@freezed
class FreezedCl with _$FreezedCl {
// should skip because hasn't aby parameters.
  const factory FreezedCl.loading() = Loading;
  // should skip because name of redirected clasess start from underscore
  const factory FreezedCl.loading3({required final double percent}) = _Loading2;
  const factory FreezedCl.error([final String? message]) = ErrorDetails;
  const factory FreezedCl.complex(final int a, final String b) = Complex;
}
