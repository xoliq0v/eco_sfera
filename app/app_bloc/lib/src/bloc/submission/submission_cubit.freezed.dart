// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubmissionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PartnerData partnerData, DriverData driverData)
        success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PartnerData partnerData, DriverData driverData)? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PartnerData partnerData, DriverData driverData)? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubmissionStateSuccess value) success,
    required TResult Function(_SubmissionStateError value) error,
    required TResult Function(_SubmissionStateLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmissionStateSuccess value)? success,
    TResult? Function(_SubmissionStateError value)? error,
    TResult? Function(_SubmissionStateLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmissionStateSuccess value)? success,
    TResult Function(_SubmissionStateError value)? error,
    TResult Function(_SubmissionStateLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionStateCopyWith<$Res> {
  factory $SubmissionStateCopyWith(
          SubmissionState value, $Res Function(SubmissionState) then) =
      _$SubmissionStateCopyWithImpl<$Res, SubmissionState>;
}

/// @nodoc
class _$SubmissionStateCopyWithImpl<$Res, $Val extends SubmissionState>
    implements $SubmissionStateCopyWith<$Res> {
  _$SubmissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SubmissionStateSuccessImplCopyWith<$Res> {
  factory _$$SubmissionStateSuccessImplCopyWith(
          _$SubmissionStateSuccessImpl value,
          $Res Function(_$SubmissionStateSuccessImpl) then) =
      __$$SubmissionStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PartnerData partnerData, DriverData driverData});
}

/// @nodoc
class __$$SubmissionStateSuccessImplCopyWithImpl<$Res>
    extends _$SubmissionStateCopyWithImpl<$Res, _$SubmissionStateSuccessImpl>
    implements _$$SubmissionStateSuccessImplCopyWith<$Res> {
  __$$SubmissionStateSuccessImplCopyWithImpl(
      _$SubmissionStateSuccessImpl _value,
      $Res Function(_$SubmissionStateSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partnerData = null,
    Object? driverData = null,
  }) {
    return _then(_$SubmissionStateSuccessImpl(
      null == partnerData
          ? _value.partnerData
          : partnerData // ignore: cast_nullable_to_non_nullable
              as PartnerData,
      null == driverData
          ? _value.driverData
          : driverData // ignore: cast_nullable_to_non_nullable
              as DriverData,
    ));
  }
}

/// @nodoc

class _$SubmissionStateSuccessImpl implements _SubmissionStateSuccess {
  const _$SubmissionStateSuccessImpl(this.partnerData, this.driverData);

  @override
  final PartnerData partnerData;
  @override
  final DriverData driverData;

  @override
  String toString() {
    return 'SubmissionState.success(partnerData: $partnerData, driverData: $driverData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionStateSuccessImpl &&
            (identical(other.partnerData, partnerData) ||
                other.partnerData == partnerData) &&
            (identical(other.driverData, driverData) ||
                other.driverData == driverData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partnerData, driverData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionStateSuccessImplCopyWith<_$SubmissionStateSuccessImpl>
      get copyWith => __$$SubmissionStateSuccessImplCopyWithImpl<
          _$SubmissionStateSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PartnerData partnerData, DriverData driverData)
        success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return success(partnerData, driverData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PartnerData partnerData, DriverData driverData)? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return success?.call(partnerData, driverData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PartnerData partnerData, DriverData driverData)? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(partnerData, driverData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubmissionStateSuccess value) success,
    required TResult Function(_SubmissionStateError value) error,
    required TResult Function(_SubmissionStateLoading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmissionStateSuccess value)? success,
    TResult? Function(_SubmissionStateError value)? error,
    TResult? Function(_SubmissionStateLoading value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmissionStateSuccess value)? success,
    TResult Function(_SubmissionStateError value)? error,
    TResult Function(_SubmissionStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SubmissionStateSuccess implements SubmissionState {
  const factory _SubmissionStateSuccess(
          final PartnerData partnerData, final DriverData driverData) =
      _$SubmissionStateSuccessImpl;

  PartnerData get partnerData;
  DriverData get driverData;
  @JsonKey(ignore: true)
  _$$SubmissionStateSuccessImplCopyWith<_$SubmissionStateSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmissionStateErrorImplCopyWith<$Res> {
  factory _$$SubmissionStateErrorImplCopyWith(_$SubmissionStateErrorImpl value,
          $Res Function(_$SubmissionStateErrorImpl) then) =
      __$$SubmissionStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SubmissionStateErrorImplCopyWithImpl<$Res>
    extends _$SubmissionStateCopyWithImpl<$Res, _$SubmissionStateErrorImpl>
    implements _$$SubmissionStateErrorImplCopyWith<$Res> {
  __$$SubmissionStateErrorImplCopyWithImpl(_$SubmissionStateErrorImpl _value,
      $Res Function(_$SubmissionStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SubmissionStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubmissionStateErrorImpl implements _SubmissionStateError {
  const _$SubmissionStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SubmissionState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionStateErrorImplCopyWith<_$SubmissionStateErrorImpl>
      get copyWith =>
          __$$SubmissionStateErrorImplCopyWithImpl<_$SubmissionStateErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PartnerData partnerData, DriverData driverData)
        success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PartnerData partnerData, DriverData driverData)? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PartnerData partnerData, DriverData driverData)? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
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
    required TResult Function(_SubmissionStateSuccess value) success,
    required TResult Function(_SubmissionStateError value) error,
    required TResult Function(_SubmissionStateLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmissionStateSuccess value)? success,
    TResult? Function(_SubmissionStateError value)? error,
    TResult? Function(_SubmissionStateLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmissionStateSuccess value)? success,
    TResult Function(_SubmissionStateError value)? error,
    TResult Function(_SubmissionStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SubmissionStateError implements SubmissionState {
  const factory _SubmissionStateError(final String message) =
      _$SubmissionStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SubmissionStateErrorImplCopyWith<_$SubmissionStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmissionStateLoadingImplCopyWith<$Res> {
  factory _$$SubmissionStateLoadingImplCopyWith(
          _$SubmissionStateLoadingImpl value,
          $Res Function(_$SubmissionStateLoadingImpl) then) =
      __$$SubmissionStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmissionStateLoadingImplCopyWithImpl<$Res>
    extends _$SubmissionStateCopyWithImpl<$Res, _$SubmissionStateLoadingImpl>
    implements _$$SubmissionStateLoadingImplCopyWith<$Res> {
  __$$SubmissionStateLoadingImplCopyWithImpl(
      _$SubmissionStateLoadingImpl _value,
      $Res Function(_$SubmissionStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmissionStateLoadingImpl implements _SubmissionStateLoading {
  const _$SubmissionStateLoadingImpl();

  @override
  String toString() {
    return 'SubmissionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PartnerData partnerData, DriverData driverData)
        success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PartnerData partnerData, DriverData driverData)? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PartnerData partnerData, DriverData driverData)? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
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
    required TResult Function(_SubmissionStateSuccess value) success,
    required TResult Function(_SubmissionStateError value) error,
    required TResult Function(_SubmissionStateLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmissionStateSuccess value)? success,
    TResult? Function(_SubmissionStateError value)? error,
    TResult? Function(_SubmissionStateLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmissionStateSuccess value)? success,
    TResult Function(_SubmissionStateError value)? error,
    TResult Function(_SubmissionStateLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SubmissionStateLoading implements SubmissionState {
  const factory _SubmissionStateLoading() = _$SubmissionStateLoadingImpl;
}
