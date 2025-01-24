import 'package:core/core.dart';
import 'package:repository/repository.dart';

import '../change_trash_price_use_case.dart';

class ChangeTrashPriceUseCaseImpl implements ChangeTrashPriceUseCase {
  final PartnerRepo partnerRepo;

  ChangeTrashPriceUseCaseImpl({required this.partnerRepo});

  @override
  Future<Result<bool>> call(int trashId, String price) {
    return partnerRepo.changeTrashPrice(trashId, price);
  }
}
