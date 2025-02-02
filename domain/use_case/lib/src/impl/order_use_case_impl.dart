import 'package:core/core.dart';
import 'package:model/src/order.dart';
import 'package:repository/repository.dart';
import '../order_use_case.dart';

class GetOrderImpl extends GetOrder{
  GetOrderImpl({required this.orderRepo});

  final OrderRepo orderRepo;

  @override
  Future<Result<List<OrderModel>>> get() async {
    try {
      return await orderRepo.getOrders();
    } catch (e) {
      return Result.error(ResultError(reason: e.toString(),message: e.toString()));
    }
  }

}

class WatchPostImpl extends WatchPost{
  WatchPostImpl({required this.orderRepo});

  final OrderRepo orderRepo;

  @override
  Future<Result<bool>> watch(int id) async {
    try{
      return await orderRepo.watch(id);
    }catch(e){
      return Result.error(ResultError(reason: e.toString(),message: e.toString()));
    }
  }

}