import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:model/src/order.dart';
import 'package:network/network.dart';
import '../../mapping/order_mapping.dart';
import '../order_repo.dart';
import '../../mapping/pageable_content_mapping.dart';

import '../../mapping/partner_order_mapper.dart';

class OrderRepoImpl extends OrderRepo {
  OrderRepoImpl({required this.orderProvider});

  final OrderProvider orderProvider;

  @override
  Future<Result<List<OrderModel>>> getOrders() async {
    final res = await orderProvider.getOrders();
    if (res.data == null) return Result.error(
        ResultError(
          message: res.error?.message ?? 'Something went wrong',
          reason:  res.error?.reason ?? 'Something went wrong'
        )
    );
    return Result.completed(
        res.data!.map((data){
          return data.toOrderModel();
        }).toList()
    );
  }

  @override
  Future<Result<bool>> watch(int id) async {
    final res = await orderProvider.watch(id);
    if(res.data ?? false){
      return Result.completed(res.data);
    }else{
      throw 'Something went wrong!';
    }
  }

  @override
  Future<Result<BasePaginatedResponse<PartnerOrder>?>> getPartnerOrders(int page, int size, String status) async {
    return toResult2(
      orderProvider.getPartnerOrders(page, size, status),
      fromSuccessResponse: (response){
      return response.data?.toBasePaginatedResponse(contentMapper: (json) {
        final data = json as PartnerOrderDto;
        return data.toPartnerOrderModel();
      });
    });
  }

  @override
  Future<Result<bool>> changeOrderStatus(int id, String status) async {
    final res = await orderProvider.changeOrderStatus(id, status);
    return Result.completed(res.data ?? false);
  }
}
