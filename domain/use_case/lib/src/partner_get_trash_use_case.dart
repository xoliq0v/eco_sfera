import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class PartnerGetTrashUseCase {
  Future<Result<List<PartnerTrash>>> call();
}