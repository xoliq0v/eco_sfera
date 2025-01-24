import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

import '../partner_get_trash_use_case.dart';

class PartnerGetTrashUseCaseImpl implements PartnerGetTrashUseCase {
  final PartnerRepo partnerRepo;

  PartnerGetTrashUseCaseImpl({required this.partnerRepo});

  @override
  Future<Result<List<PartnerTrash>>> call() {
    return partnerRepo.fetchPartnerTrashes();
  }
}