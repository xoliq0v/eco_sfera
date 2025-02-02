import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class PostAddUseCase {
  Future<Result<bool>> post(Announcement announcement);
}