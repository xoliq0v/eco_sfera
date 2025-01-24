import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

abstract class OrderRepo extends BaseRepository {

  Future<Result<List<OrderModel>>> getOrders();
  Future<Result<bool>> watch(int id);
  Future<Result<BasePaginatedResponse<PartnerOrder>?>> getPartnerOrders(int page, int size, String status);

}