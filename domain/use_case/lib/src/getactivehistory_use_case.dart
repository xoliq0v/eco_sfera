import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class GetActiveHistory {
  Future<Result<BasePaginatedResponse<ActiveHistory>?>> get(int page,int size);
}