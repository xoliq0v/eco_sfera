import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class FetchPartners {
  Future<Result<BasePaginatedResponse<PartnerItem>?>> get(int page,int size);
}