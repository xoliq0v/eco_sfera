
part of 'customer_cubit.dart';

@freezed
sealed class CustomerState with _$CustomerState {

  const factory CustomerState.init() = _Init;

  const factory CustomerState.loading() = _Loading;

  const factory CustomerState.success({
    required List<Customer> customers,
  }) = _Success;

  const factory CustomerState.error(String error) = _Error;

}