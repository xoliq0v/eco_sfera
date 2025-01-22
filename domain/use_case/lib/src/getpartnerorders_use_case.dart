import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class GetPartnerOrders {
  Future<Result<bool>> get(int page);
}