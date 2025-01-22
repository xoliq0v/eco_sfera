part of 'product_cubit.dart';

@freezed
sealed class ProductState with _$ProductState {

  const factory ProductState.init() = _Init;

  const factory ProductState.loading() = _Loading;

  const factory ProductState.success(List<Product> products) = _Success;

  const factory ProductState.error(String error) = _Error;

}