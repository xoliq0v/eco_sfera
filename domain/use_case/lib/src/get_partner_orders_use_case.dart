import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class GetPartnerOrdersUseCase {
  Future<Result<BasePaginatedResponse<PartnerOrder>?>> getPartnerOrders(int page, int size, String status);
}