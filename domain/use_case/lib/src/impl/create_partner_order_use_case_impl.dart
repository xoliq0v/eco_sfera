import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

import '../create_partner_order_use_case.dart';

class CreatePartnerOrderUseCaseImpl extends CreatePartnerOrderUseCase {
  final PartnerRepo partnerRepo;

  CreatePartnerOrderUseCaseImpl(this.partnerRepo);

  @override
  Future<Result<bool>> createOrder(Submission submission) {
    return partnerRepo.createOrder(submission);
  }
}