part of 'ad_cubit.dart';

@freezed
sealed class AdState with _$AdState {
  const factory AdState.init() = _Init;
  const factory AdState.loading() = _Loading;
  const factory AdState.success() = _Success;
  const factory AdState.error() = _Error;
}