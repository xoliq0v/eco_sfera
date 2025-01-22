import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this.getAllProducts,
  ) : super(const ProductState.init());

  final GetAllProducts getAllProducts;

  Future<void> getProducts() async {
    emit(const ProductState.loading());
    final result = await getAllProducts.get();
    if(result.data != null){
      emit(ProductState.success(result.data!));
    }else{
      emit(ProductState.error(result.error?.message ?? ''));
    }
  }
}