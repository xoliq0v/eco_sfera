import 'package:core/core.dart';

abstract class ChangePartnerStatusUseCase {
  Future<Result<bool>> call(bool status);
}