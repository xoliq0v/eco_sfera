part of 'transaction_cubit.dart';

@freezed
sealed class TransactionState with _$TransactionState {

  const factory TransactionState.init() = _Init;

  const factory TransactionState.loading() = _Loading;

  const factory TransactionState.success(TransactionsResponse data,DriverData user) = _Success;

  const factory TransactionState.error(String error) = _Error;

}