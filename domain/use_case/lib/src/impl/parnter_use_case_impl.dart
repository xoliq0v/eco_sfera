import 'package:model/model.dart';
import 'package:repository/repository.dart';

import '../partner_use_case.dart';

class FetchPartnerProfileImpl extends FetchPartnerProfile {
  FetchPartnerProfileImpl({required this.partnerRepo});

  final PartnerRepo partnerRepo;

  @override
  Future<int?> fetch() {
    return partnerRepo.fetchPartnerInfo();
  }
}

class GetPartnerProfileImpl extends GetPartnerProfile {
  GetPartnerProfileImpl({required this.partnerRepo});

  final PartnerRepo partnerRepo;

  @override
  PartnerInfoModel? get() {
    return partnerRepo.getPartnerProfile();
  }

  @override
  Stream<PartnerInfoModel?> watch() {
    return partnerRepo.watchPartnerProfile();
  }

}