import 'package:core/core.dart';

abstract class ChangeOrderStatusUseCase{
  Future<Result<bool>> call(int id, String status);
}