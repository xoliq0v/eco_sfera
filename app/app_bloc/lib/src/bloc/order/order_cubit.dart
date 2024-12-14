import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

part 'order_cubit.freezed.dart';
part  'order_state.dart';

class OrderCubit extends Cubit<OrderState>{
  OrderCubit(
      this.getOrderUseCase
      ) : super(OrderState.init()){
    getOrder();
  }

  final GetOrder getOrderUseCase;

  Future<void> getOrder() async{

    emit(OrderState.loading());

    final result = await getOrderUseCase.get();

    if (result.status == Status.error || result.data == null) {
      emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
      return;
    }

    try {
      emit(OrderState.success( result.data ?? [] ));
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }

  }

  Future<void> retry()async{
    final result = await getOrderUseCase.get();

    if (result.status == Status.error || result.data == null) {
      emit(OrderState.error(result.error?.message ?? 'Something went wrong'));
      return;
    }

    try {
      emit(OrderState.success( result.data ?? [] ));
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }
  }

}