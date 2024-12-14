import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/order_dto.dart';

abstract class OrderProvider extends BaseProvider {

  Future<ApiResponse<List<OrderDto>>> getOrders();

}
