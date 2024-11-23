
part of 'auth_cubit.dart';

@freezed
sealed class AuthState with _$AuthState {

  const factory AuthState.init() = _Init;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.success() = _Success;

  const factory AuthState.error(String error) = _Error;

}