import 'package:model/model.dart';
import 'package:repository/repository.dart';

import '../get_partner_data_use_case.dart';

class GetPartnerDataUseCaseImpl implements GetPartnerDataUseCase {
  final PartnerRepo partnerRepo;

  GetPartnerDataUseCaseImpl(this.partnerRepo);

  @override
  Future<PartnerData?> getPartnerData(int id) async {
    final result = await partnerRepo.getPartnerData(id);
    if(result.data != null){
      return result.data;
    }
    return null;
  }
}