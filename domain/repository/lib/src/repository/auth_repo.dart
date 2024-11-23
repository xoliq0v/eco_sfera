import 'package:core/core.dart';
import 'package:repository/repository.dart';

abstract class AuthRepository extends BaseRepository {

  Future<Result<String>> login({
    required String login,
    required String password,
  });

  Future<Result<bool>> logout();
}
