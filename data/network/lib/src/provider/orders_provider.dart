import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/order_dto.dart';

abstract class OrderProvider extends BaseProvider {

  Future<ApiResponse<List<OrderDto>>> getOrders();

  Future<ApiResponse<bool>> watch(int id);

  Future<ApiResponse<PageableContentDTO<PartnerOrderDto>>> getPartnerOrders(int page,int size,String status);
}