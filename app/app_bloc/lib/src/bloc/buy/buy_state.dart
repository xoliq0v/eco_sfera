part of 'buy_cubit.dart';

@freezed
sealed class BuyState with _$BuyState {

  const factory BuyState.init() = _Init;

  const factory BuyState.loading() = _Loading;

  const factory BuyState.buyLoading() = _BuyLoading;

  const factory BuyState.success(List<TrashInfo> params,DriverData user) = _Success;

  const factory BuyState.buySuccess(BuyCheckModel check) = _BuySuccess;

  const factory BuyState.error(String error) = _Error;

  const factory BuyState.searchResult(List<Customer> customers) = _SearchResult;

  const factory BuyState.searchLoading() = _SearchLoading;

  const factory BuyState.notEnoughBalance() = _NotEnoughBalance;
}