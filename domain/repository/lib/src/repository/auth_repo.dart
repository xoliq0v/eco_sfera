import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

abstract class AuthRepository extends BaseRepository {

  Future<Result<String>> login({
    required AuthModel auth,
  });

  Future<Result<bool>> logout();
}
