import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class GetOrder {

  Future<Result<List<OrderModel>>> get();

}

abstract class WatchPost {

  Future<Result<bool>> watch(int id);

}