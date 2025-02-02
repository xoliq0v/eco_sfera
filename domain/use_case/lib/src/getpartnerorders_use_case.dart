import 'package:core/core.dart';

abstract class GetPartnerOrders {
  Future<Result<bool>> get(int page);
}