import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

part 'post_customer_cubit.freezed.dart';
part 'post_customer_state.dart';

class PostCustomerCubit extends Cubit<PostCustomerState>{
  PostCustomerCubit(
      this._postCustomer
      ) : super(PostCustomerState.init());

  final PostCustomer _postCustomer;


  Future<void> post(CustomerPostModel model) async{

    emit(PostCustomerState.loading());

    final res = await _postCustomer.post(model: model);

    switch (res.status) {
      case Status.completed:
        emit(PostCustomerState.success(res: res.data ?? false));
      case Status.error:
        emit(PostCustomerState.error(res.error?.message ?? ''));
    }

  }

}