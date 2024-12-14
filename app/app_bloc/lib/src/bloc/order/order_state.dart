
part of 'order_cubit.dart';

@freezed
sealed class OrderState with _$OrderState {

  const factory OrderState.init() = _Init;

  const factory OrderState.loading() = _Loading;

  const factory OrderState.success(List<OrderModel> orders) = _Success;

  const factory OrderState.error(String error) = _Error;

}