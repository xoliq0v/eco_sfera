import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

import '../partner_edit_use_case.dart';

class PartnerEditUseCaseImpl implements PartnerEditUseCase {
  final PartnerRepo partnerRepo;

  PartnerEditUseCaseImpl({required this.partnerRepo});

  @override
  Future<Result<bool>> call(PartnerEdit partnerEdit) {
    return partnerRepo.editPartner(partnerEdit);
  }
}