
import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

part 'customer_cubit.freezed.dart';
part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState>{
  CustomerCubit(
      this.getCustomer,
      ):super(CustomerState.init());

  final GetCustomer getCustomer;


  bool isLoaded = false;

  Future<void> fetchTop() async {
    if (!isLoaded) emit(const CustomerState.loading());
    final res = await getCustomer.get(page: 0, size: 5);
    switch (res.status) {
      case Status.completed:
        isLoaded = true;
        final customers = res.data?.content ?? [];
        emit(CustomerState.success(customers: customers));
      case Status.error:
        emit(CustomerState.error(res.error?.message ?? ''));
    }
  }

}