part of 'logout_cubit.dart';

@freezed
sealed class LogoutState with _$LogoutState {
  const factory LogoutState.init() = _Init;

  const factory LogoutState.loading() = _Loading;

  const factory LogoutState.success() = _Success;

  const factory LogoutState.error(String message) = _Error;
}