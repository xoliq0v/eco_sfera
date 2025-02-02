import 'package:core/core.dart';
import 'package:model/model.dart';
import '../../repository.dart';

abstract class AuthRepository extends BaseRepository {

  Future<Result<AuthResult>> login({
    required AuthModel auth,
  });

  Future<Result<bool>> logout();

  Future<Result<bool>> refreshFCMToken(String token);
}
