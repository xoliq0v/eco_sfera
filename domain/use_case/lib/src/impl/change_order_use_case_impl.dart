import 'package:core/core.dart';
import 'package:repository/repository.dart';

import '../change_order_status_use_case.dart';

class ChangeOrderUseCaseImpl extends ChangeOrderStatusUseCase{
  final OrderRepo orderRepo;

  ChangeOrderUseCaseImpl(this.orderRepo);

  @override
  Future<Result<bool>> call(int id, String status) async {
    return orderRepo.changeOrderStatus(id, status);
  }
}