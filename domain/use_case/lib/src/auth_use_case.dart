import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class AuthUseCase {
  Future<Result<AuthResult>> login({
    required String login,
    required String password,
    required String deviceToken
  });
}

abstract class Logout {
  Future<Result<bool>> logout();
}