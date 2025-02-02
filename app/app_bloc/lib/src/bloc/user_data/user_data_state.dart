part of 'user_data_cubit.dart';

@freezed
sealed class UserDataState with _$UserDataState {
  const factory UserDataState.init() = _Init;
  const factory UserDataState.loading() = _Loading;
  const factory UserDataState.success({DriverData? driver,PartnerInfoModel? partner}) = _Success;
  const factory UserDataState.error() = _Error;
}