import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class CreatePartnerOrderUseCase {
  Future<Result<bool>> createOrder(Submission submission);
}
