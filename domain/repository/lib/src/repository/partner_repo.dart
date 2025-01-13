import 'package:core/core.dart';
import 'package:model/model.dart';

import '../../repository.dart';

abstract class PartnerRepo extends BaseRepository {

  // Future<Result<BasePaginatedResponse<Partner>>> fetchPartner();

  // Future<Result<BasePaginatedResponse<Partner>>> searchPartnerByName();

  Future<int?> fetchPartnerInfo();

  PartnerInfoModel? getPartnerProfile();

  Stream<PartnerInfoModel?> watchPartnerProfile();

  Future<Result<BasePaginatedResponse<PartnerItem>?>> fetchPartners(int page,int size);
}