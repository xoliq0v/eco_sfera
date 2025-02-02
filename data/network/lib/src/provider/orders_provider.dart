import 'package:core/core.dart';
import 'package:network/network.dart';

abstract class OrderProvider extends BaseProvider {

  Future<ApiResponse<List<OrderDto>>> getOrders();

  Future<ApiResponse<bool>> watch(int id);

  Future<ApiResponse<bool>> changeOrderStatus(int id,String status);

  Future<ApiResponse<PageableContentDTO<PartnerOrderDto>>> getPartnerOrders(int page,int size,String status);

}