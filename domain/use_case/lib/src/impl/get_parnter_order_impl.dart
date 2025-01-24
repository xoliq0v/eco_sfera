import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

import '../../use_case.dart';

class GetPartnerOrderImpl extends GetPartnerOrdersUseCase {
  GetPartnerOrderImpl({required this.orderRepo});

  final OrderRepo orderRepo;

  @override
  Future<Result<BasePaginatedResponse<PartnerOrder>?>> getPartnerOrders(int page, int size, String status) {
    return orderRepo.getPartnerOrders(page, size, status);
  }
}