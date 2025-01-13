import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import '../fetchpartners_use_case.dart';

class FetchPartnersImpl extends FetchPartners {
  FetchPartnersImpl({required this.partnerRepo});

  final PartnerRepo partnerRepo;

  @override
  Future<Result<BasePaginatedResponse<PartnerItem>?>> get(int page,int size) {
    return partnerRepo.fetchPartners(page,size);
  }
}