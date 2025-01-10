
part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.init() = _Init;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.success(
      List<OrderModel> orders, {
        required LocationEntity? currentLocation,
        @Default(false) bool isInitialFetch,
        @Default(false) bool isRealtime,
        @Default([]) List<OrderModel> newOrders,
      }) = _Success;
  const factory OrderState.error(String message) = _Error;
}