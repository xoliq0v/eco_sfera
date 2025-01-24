import 'package:core/core.dart';

abstract class ChangeTrashPriceUseCase {
  Future<Result<bool>> call(int trashId, String price);
}