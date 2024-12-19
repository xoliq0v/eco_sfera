part of 'buy_cubit.dart';

@freezed
sealed class BuyState with _$BuyState {

  const factory BuyState.init() = _Init;

  const factory BuyState.loading() = _Loading;

  const factory BuyState.buyLoading() = _BuyLoading;

  const factory BuyState.success(List<TrashParamModel> params) = _Success;

  const factory BuyState.buySuccess() = _BuySuccess;

  const factory BuyState.error(String error) = _Error;

}