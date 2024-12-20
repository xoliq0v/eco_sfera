// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buy_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BuyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashParamModel> params) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashParamModel> params)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashParamModel> params)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BuyLoading value) buyLoading,
    required TResult Function(_Success value) success,
    required TResult Function(_BuySuccess value) buySuccess,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BuyLoading value)? buyLoading,
    TResult? Function(_Success value)? success,
    TResult? Function(_BuySuccess value)? buySuccess,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Loading value)? loading,
    TResult Function(_BuyLoading value)? buyLoading,
    TResult Function(_Success value)? success,
    TResult Function(_BuySuccess value)? buySuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyStateCopyWith<$Res> {
  factory $BuyStateCopyWith(BuyState value, $Res Function(BuyState) then) =
      _$BuyStateCopyWithImpl<$Res, BuyState>;
}

/// @nodoc
class _$BuyStateCopyWithImpl<$Res, $Val extends BuyState>
    implements $BuyStateCopyWith<$Res> {
  _$BuyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$BuyStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements _Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'BuyState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashParamModel> params) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashParamModel> params)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashParamModel> params)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BuyLoading value) buyLoading,
    required TResult Function(_Success value) success,
    required TResult Function(_BuySuccess value) buySuccess,
    required TResult Function(_Error value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BuyLoading value)? buyLoading,
    TResult? Function(_Success value)? success,
    TResult? Function(_BuySuccess value)? buySuccess,
    TResult? Function(_Error value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Loading value)? loading,
    TResult Function(_BuyLoading value)? buyLoading,
    TResult Function(_Success value)? success,
    TResult Function(_BuySuccess value)? buySuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements BuyState {
  const factory _Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BuyStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'BuyState.loading()';
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
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashParamModel> params) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashParamModel> params)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashParamModel> params)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
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
    required TResult Function(_Init value) init,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BuyLoading value) buyLoading,
    required TResult Function(_Success value) success,
    required TResult Function(_BuySuccess value) buySuccess,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BuyLoading value)? buyLoading,
    TResult? Function(_Success value)? success,
    TResult? Function(_BuySuccess value)? buySuccess,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Loading value)? loading,
    TResult Function(_BuyLoading value)? buyLoading,
    TResult Function(_Success value)? success,
    TResult Function(_BuySuccess value)? buySuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BuyState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$BuyLoadingImplCopyWith<$Res> {
  factory _$$BuyLoadingImplCopyWith(
          _$BuyLoadingImpl value, $Res Function(_$BuyLoadingImpl) then) =
      __$$BuyLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BuyLoadingImplCopyWithImpl<$Res>
    extends _$BuyStateCopyWithImpl<$Res, _$BuyLoadingImpl>
    implements _$$BuyLoadingImplCopyWith<$Res> {
  __$$BuyLoadingImplCopyWithImpl(
      _$BuyLoadingImpl _value, $Res Function(_$BuyLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuyLoadingImpl implements _BuyLoading {
  const _$BuyLoadingImpl();

  @override
  String toString() {
    return 'BuyState.buyLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BuyLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashParamModel> params) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
  }) {
    return buyLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashParamModel> params)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
  }) {
    return buyLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashParamModel> params)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (buyLoading != null) {
      return buyLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BuyLoading value) buyLoading,
    required TResult Function(_Success value) success,
    required TResult Function(_BuySuccess value) buySuccess,
    required TResult Function(_Error value) error,
  }) {
    return buyLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BuyLoading value)? buyLoading,
    TResult? Function(_Success value)? success,
    TResult? Function(_BuySuccess value)? buySuccess,
    TResult? Function(_Error value)? error,
  }) {
    return buyLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Loading value)? loading,
    TResult Function(_BuyLoading value)? buyLoading,
    TResult Function(_Success value)? success,
    TResult Function(_BuySuccess value)? buySuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (buyLoading != null) {
      return buyLoading(this);
    }
    return orElse();
  }
}

abstract class _BuyLoading implements BuyState {
  const factory _BuyLoading() = _$BuyLoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TrashParamModel> params});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$BuyStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$SuccessImpl(
      null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<TrashParamModel>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<TrashParamModel> params) : _params = params;

  final List<TrashParamModel> _params;
  @override
  List<TrashParamModel> get params {
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_params);
  }

  @override
  String toString() {
    return 'BuyState.success(params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashParamModel> params) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
  }) {
    return success(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashParamModel> params)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
  }) {
    return success?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashParamModel> params)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BuyLoading value) buyLoading,
    required TResult Function(_Success value) success,
    required TResult Function(_BuySuccess value) buySuccess,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BuyLoading value)? buyLoading,
    TResult? Function(_Success value)? success,
    TResult? Function(_BuySuccess value)? buySuccess,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Loading value)? loading,
    TResult Function(_BuyLoading value)? buyLoading,
    TResult Function(_Success value)? success,
    TResult Function(_BuySuccess value)? buySuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements BuyState {
  const factory _Success(final List<TrashParamModel> params) = _$SuccessImpl;

  List<TrashParamModel> get params;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BuySuccessImplCopyWith<$Res> {
  factory _$$BuySuccessImplCopyWith(
          _$BuySuccessImpl value, $Res Function(_$BuySuccessImpl) then) =
      __$$BuySuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BuySuccessImplCopyWithImpl<$Res>
    extends _$BuyStateCopyWithImpl<$Res, _$BuySuccessImpl>
    implements _$$BuySuccessImplCopyWith<$Res> {
  __$$BuySuccessImplCopyWithImpl(
      _$BuySuccessImpl _value, $Res Function(_$BuySuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuySuccessImpl implements _BuySuccess {
  const _$BuySuccessImpl();

  @override
  String toString() {
    return 'BuyState.buySuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BuySuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashParamModel> params) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
  }) {
    return buySuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashParamModel> params)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
  }) {
    return buySuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashParamModel> params)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (buySuccess != null) {
      return buySuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BuyLoading value) buyLoading,
    required TResult Function(_Success value) success,
    required TResult Function(_BuySuccess value) buySuccess,
    required TResult Function(_Error value) error,
  }) {
    return buySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BuyLoading value)? buyLoading,
    TResult? Function(_Success value)? success,
    TResult? Function(_BuySuccess value)? buySuccess,
    TResult? Function(_Error value)? error,
  }) {
    return buySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Loading value)? loading,
    TResult Function(_BuyLoading value)? buyLoading,
    TResult Function(_Success value)? success,
    TResult Function(_BuySuccess value)? buySuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (buySuccess != null) {
      return buySuccess(this);
    }
    return orElse();
  }
}

abstract class _BuySuccess implements BuyState {
  const factory _BuySuccess() = _$BuySuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BuyStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'BuyState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashParamModel> params) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashParamModel> params)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashParamModel> params)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BuyLoading value) buyLoading,
    required TResult Function(_Success value) success,
    required TResult Function(_BuySuccess value) buySuccess,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BuyLoading value)? buyLoading,
    TResult? Function(_Success value)? success,
    TResult? Function(_BuySuccess value)? buySuccess,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Loading value)? loading,
    TResult Function(_BuyLoading value)? buyLoading,
    TResult Function(_Success value)? success,
    TResult Function(_BuySuccess value)? buySuccess,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BuyState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
