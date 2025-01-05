import 'package:model/model.dart';

abstract class PartnerRepo{

  // Future<Result<BasePaginatedResponse<Partner>>> fetchPartner();

  // Future<Result<BasePaginatedResponse<Partner>>> searchPartnerByName();

  Future<int?> fetchPartnerInfo();

  PartnerInfoModel? getPartnerProfile();

  Stream<PartnerInfoModel?> watchPartnerProfile();

}