// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fr_union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FreezedCl {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double percent) loading3,
    required TResult Function(String? message) error,
    required TResult Function(int a, String b) complex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(double percent)? loading3,
    TResult? Function(String? message)? error,
    TResult? Function(int a, String b)? complex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double percent)? loading3,
    TResult Function(String? message)? error,
    TResult Function(int a, String b)? complex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(_Loading2 value) loading3,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(Complex value) complex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(_Loading2 value)? loading3,
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(Complex value)? complex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(_Loading2 value)? loading3,
    TResult Function(ErrorDetails value)? error,
    TResult Function(Complex value)? complex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedClCopyWith<$Res> {
  factory $FreezedClCopyWith(FreezedCl value, $Res Function(FreezedCl) then) =
      _$FreezedClCopyWithImpl<$Res, FreezedCl>;
}

/// @nodoc
class _$FreezedClCopyWithImpl<$Res, $Val extends FreezedCl>
    implements $FreezedClCopyWith<$Res> {
  _$FreezedClCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$FreezedClCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'FreezedCl.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double percent) loading3,
    required TResult Function(String? message) error,
    required TResult Function(int a, String b) complex,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(double percent)? loading3,
    TResult? Function(String? message)? error,
    TResult? Function(int a, String b)? complex,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double percent)? loading3,
    TResult Function(String? message)? error,
    TResult Function(int a, String b)? complex,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(_Loading2 value) loading3,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(Complex value) complex,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(_Loading2 value)? loading3,
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(Complex value)? complex,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(_Loading2 value)? loading3,
    TResult Function(ErrorDetails value)? error,
    TResult Function(Complex value)? complex,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements FreezedCl {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$Loading2ImplCopyWith<$Res> {
  factory _$$Loading2ImplCopyWith(
          _$Loading2Impl value, $Res Function(_$Loading2Impl) then) =
      __$$Loading2ImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double percent});
}

/// @nodoc
class __$$Loading2ImplCopyWithImpl<$Res>
    extends _$FreezedClCopyWithImpl<$Res, _$Loading2Impl>
    implements _$$Loading2ImplCopyWith<$Res> {
  __$$Loading2ImplCopyWithImpl(
      _$Loading2Impl _value, $Res Function(_$Loading2Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percent = null,
  }) {
    return _then(_$Loading2Impl(
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$Loading2Impl implements _Loading2 {
  const _$Loading2Impl({required this.percent});

  @override
  final double percent;

  @override
  String toString() {
    return 'FreezedCl.loading3(percent: $percent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading2Impl &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, percent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Loading2ImplCopyWith<_$Loading2Impl> get copyWith =>
      __$$Loading2ImplCopyWithImpl<_$Loading2Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double percent) loading3,
    required TResult Function(String? message) error,
    required TResult Function(int a, String b) complex,
  }) {
    return loading3(percent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(double percent)? loading3,
    TResult? Function(String? message)? error,
    TResult? Function(int a, String b)? complex,
  }) {
    return loading3?.call(percent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double percent)? loading3,
    TResult Function(String? message)? error,
    TResult Function(int a, String b)? complex,
    required TResult orElse(),
  }) {
    if (loading3 != null) {
      return loading3(percent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(_Loading2 value) loading3,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(Complex value) complex,
  }) {
    return loading3(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(_Loading2 value)? loading3,
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(Complex value)? complex,
  }) {
    return loading3?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(_Loading2 value)? loading3,
    TResult Function(ErrorDetails value)? error,
    TResult Function(Complex value)? complex,
    required TResult orElse(),
  }) {
    if (loading3 != null) {
      return loading3(this);
    }
    return orElse();
  }
}

abstract class _Loading2 implements FreezedCl {
  const factory _Loading2({required final double percent}) = _$Loading2Impl;

  double get percent;
  @JsonKey(ignore: true)
  _$$Loading2ImplCopyWith<_$Loading2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorDetailsImplCopyWith<$Res> {
  factory _$$ErrorDetailsImplCopyWith(
          _$ErrorDetailsImpl value, $Res Function(_$ErrorDetailsImpl) then) =
      __$$ErrorDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorDetailsImplCopyWithImpl<$Res>
    extends _$FreezedClCopyWithImpl<$Res, _$ErrorDetailsImpl>
    implements _$$ErrorDetailsImplCopyWith<$Res> {
  __$$ErrorDetailsImplCopyWithImpl(
      _$ErrorDetailsImpl _value, $Res Function(_$ErrorDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ErrorDetailsImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorDetailsImpl implements ErrorDetails {
  const _$ErrorDetailsImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'FreezedCl.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetailsImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailsImplCopyWith<_$ErrorDetailsImpl> get copyWith =>
      __$$ErrorDetailsImplCopyWithImpl<_$ErrorDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double percent) loading3,
    required TResult Function(String? message) error,
    required TResult Function(int a, String b) complex,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(double percent)? loading3,
    TResult? Function(String? message)? error,
    TResult? Function(int a, String b)? complex,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double percent)? loading3,
    TResult Function(String? message)? error,
    TResult Function(int a, String b)? complex,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(_Loading2 value) loading3,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(Complex value) complex,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(_Loading2 value)? loading3,
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(Complex value)? complex,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(_Loading2 value)? loading3,
    TResult Function(ErrorDetails value)? error,
    TResult Function(Complex value)? complex,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements FreezedCl {
  const factory ErrorDetails([final String? message]) = _$ErrorDetailsImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorDetailsImplCopyWith<_$ErrorDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComplexImplCopyWith<$Res> {
  factory _$$ComplexImplCopyWith(
          _$ComplexImpl value, $Res Function(_$ComplexImpl) then) =
      __$$ComplexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int a, String b});
}

/// @nodoc
class __$$ComplexImplCopyWithImpl<$Res>
    extends _$FreezedClCopyWithImpl<$Res, _$ComplexImpl>
    implements _$$ComplexImplCopyWith<$Res> {
  __$$ComplexImplCopyWithImpl(
      _$ComplexImpl _value, $Res Function(_$ComplexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? b = null,
  }) {
    return _then(_$ComplexImpl(
      null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ComplexImpl implements Complex {
  const _$ComplexImpl(this.a, this.b);

  @override
  final int a;
  @override
  final String b;

  @override
  String toString() {
    return 'FreezedCl.complex(a: $a, b: $b)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplexImpl &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.b, b) || other.b == b));
  }

  @override
  int get hashCode => Object.hash(runtimeType, a, b);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplexImplCopyWith<_$ComplexImpl> get copyWith =>
      __$$ComplexImplCopyWithImpl<_$ComplexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(double percent) loading3,
    required TResult Function(String? message) error,
    required TResult Function(int a, String b) complex,
  }) {
    return complex(a, b);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(double percent)? loading3,
    TResult? Function(String? message)? error,
    TResult? Function(int a, String b)? complex,
  }) {
    return complex?.call(a, b);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(double percent)? loading3,
    TResult Function(String? message)? error,
    TResult Function(int a, String b)? complex,
    required TResult orElse(),
  }) {
    if (complex != null) {
      return complex(a, b);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(_Loading2 value) loading3,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(Complex value) complex,
  }) {
    return complex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading value)? loading,
    TResult? Function(_Loading2 value)? loading3,
    TResult? Function(ErrorDetails value)? error,
    TResult? Function(Complex value)? complex,
  }) {
    return complex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(_Loading2 value)? loading3,
    TResult Function(ErrorDetails value)? error,
    TResult Function(Complex value)? complex,
    required TResult orElse(),
  }) {
    if (complex != null) {
      return complex(this);
    }
    return orElse();
  }
}

abstract class Complex implements FreezedCl {
  const factory Complex(final int a, final String b) = _$ComplexImpl;

  int get a;
  String get b;
  @JsonKey(ignore: true)
  _$$ComplexImplCopyWith<_$ComplexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
