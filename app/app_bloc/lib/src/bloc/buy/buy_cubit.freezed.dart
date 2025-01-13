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
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
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
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
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
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
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
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) {
    return buyLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) {
    return buyLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
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
  $Res call({List<TrashInfo> params, DriverData user});
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
    Object? user = null,
  }) {
    return _then(_$SuccessImpl(
      null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<TrashInfo>,
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DriverData,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<TrashInfo> params, this.user)
      : _params = params;

  final List<TrashInfo> _params;
  @override
  List<TrashInfo> get params {
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_params);
  }

  @override
  final DriverData user;

  @override
  String toString() {
    return 'BuyState.success(params: $params, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._params, _params) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_params), user);

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
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) {
    return success(params, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) {
    return success?.call(params, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(params, user);
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements BuyState {
  const factory _Success(final List<TrashInfo> params, final DriverData user) =
      _$SuccessImpl;

  List<TrashInfo> get params;
  DriverData get user;
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
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) {
    return buySuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) {
    return buySuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
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
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
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

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
          _$SearchResultImpl value, $Res Function(_$SearchResultImpl) then) =
      __$$SearchResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Customer> customers});
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$BuyStateCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
      _$SearchResultImpl _value, $Res Function(_$SearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = null,
  }) {
    return _then(_$SearchResultImpl(
      null == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ));
  }
}

/// @nodoc

class _$SearchResultImpl implements _SearchResult {
  const _$SearchResultImpl(final List<Customer> customers)
      : _customers = customers;

  final List<Customer> _customers;
  @override
  List<Customer> get customers {
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customers);
  }

  @override
  String toString() {
    return 'BuyState.searchResult(customers: $customers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_customers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) {
    return searchResult(customers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) {
    return searchResult?.call(customers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
    required TResult orElse(),
  }) {
    if (searchResult != null) {
      return searchResult(customers);
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
  }) {
    return searchResult(this);
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
  }) {
    return searchResult?.call(this);
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
    required TResult orElse(),
  }) {
    if (searchResult != null) {
      return searchResult(this);
    }
    return orElse();
  }
}

abstract class _SearchResult implements BuyState {
  const factory _SearchResult(final List<Customer> customers) =
      _$SearchResultImpl;

  List<Customer> get customers;
  @JsonKey(ignore: true)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchLoadingImplCopyWith<$Res> {
  factory _$$SearchLoadingImplCopyWith(
          _$SearchLoadingImpl value, $Res Function(_$SearchLoadingImpl) then) =
      __$$SearchLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchLoadingImplCopyWithImpl<$Res>
    extends _$BuyStateCopyWithImpl<$Res, _$SearchLoadingImpl>
    implements _$$SearchLoadingImplCopyWith<$Res> {
  __$$SearchLoadingImplCopyWithImpl(
      _$SearchLoadingImpl _value, $Res Function(_$SearchLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchLoadingImpl implements _SearchLoading {
  const _$SearchLoadingImpl();

  @override
  String toString() {
    return 'BuyState.searchLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() buyLoading,
    required TResult Function(List<TrashInfo> params, DriverData user) success,
    required TResult Function() buySuccess,
    required TResult Function(String error) error,
    required TResult Function(List<Customer> customers) searchResult,
    required TResult Function() searchLoading,
  }) {
    return searchLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? buyLoading,
    TResult? Function(List<TrashInfo> params, DriverData user)? success,
    TResult? Function()? buySuccess,
    TResult? Function(String error)? error,
    TResult? Function(List<Customer> customers)? searchResult,
    TResult? Function()? searchLoading,
  }) {
    return searchLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? buyLoading,
    TResult Function(List<TrashInfo> params, DriverData user)? success,
    TResult Function()? buySuccess,
    TResult Function(String error)? error,
    TResult Function(List<Customer> customers)? searchResult,
    TResult Function()? searchLoading,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading();
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
    required TResult Function(_SearchResult value) searchResult,
    required TResult Function(_SearchLoading value) searchLoading,
  }) {
    return searchLoading(this);
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
    TResult? Function(_SearchResult value)? searchResult,
    TResult? Function(_SearchLoading value)? searchLoading,
  }) {
    return searchLoading?.call(this);
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
    TResult Function(_SearchResult value)? searchResult,
    TResult Function(_SearchLoading value)? searchLoading,
    required TResult orElse(),
  }) {
    if (searchLoading != null) {
      return searchLoading(this);
    }
    return orElse();
  }
}

abstract class _SearchLoading implements BuyState {
  const factory _SearchLoading() = _$SearchLoadingImpl;
}
