part of 'profile_cubit.dart';

@freezed
sealed class ProfileState with _$ProfileState {

  const factory ProfileState.init() = _Init;

  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.user({required UserProfile userProfile}) = _User;

  const factory ProfileState.error(String error) = _Error;
}