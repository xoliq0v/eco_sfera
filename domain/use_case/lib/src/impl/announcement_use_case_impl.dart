import 'package:core/src/network_config/result_mapping.dart';

import 'package:model/src/requests/announcement.dart';
import 'package:repository/repository.dart';

import '../../use_case.dart';

class PostAddUseCaseImpl extends PostAddUseCase{
  PostAddUseCaseImpl(this.partnerRepo);

  final PartnerRepo partnerRepo;

  @override
  Future<Result<bool>> post(Announcement announcement) {
    return partnerRepo.postAd(announcement);
  }



}