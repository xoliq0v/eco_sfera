part of 'post_customer_cubit.dart';

@freezed
sealed class PostCustomerState with _$PostCustomerState {

  const factory PostCustomerState.init() = _Init;

  const factory PostCustomerState.loading() = _Loading;

  const factory PostCustomerState.success({
    required CustomerResponseModel customer,
  }) = _Success;

  const factory PostCustomerState.error(String error) = _Error;

}