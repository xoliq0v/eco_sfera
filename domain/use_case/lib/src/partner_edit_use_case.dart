import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class PartnerEditUseCase {
  Future<Result<bool>> call(PartnerEdit partnerEdit);
}