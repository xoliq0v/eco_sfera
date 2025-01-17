part of 'balance_cubit.dart';

@freezed
sealed class BalanceState with _$BalanceState {

  const factory BalanceState.init() = _Init;

  const factory BalanceState.loading() = _Loading;

  const factory BalanceState.success(double balance,DriverData user) = _Success;

  const factory BalanceState.error(String error) = _Error;

}