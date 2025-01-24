import 'package:core/core.dart';
import 'package:repository/repository.dart';

import '../change_partner_status_use_case.dart';

class ChangePartnerStatusUseCaseImpl implements ChangePartnerStatusUseCase {
  final PartnerRepo partnerRepo;

  ChangePartnerStatusUseCaseImpl({required this.partnerRepo});

  @override
  Future<Result<bool>> call(bool status) {
    return partnerRepo.changeStatus(status);
  }
}