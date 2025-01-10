import 'package:core/core.dart';
import 'package:model/src/order.dart';
import 'package:network/network.dart';
import 'package:repository/src/mapping/order_mapping.dart';
import 'package:repository/src/repository/order_repo.dart';

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

}