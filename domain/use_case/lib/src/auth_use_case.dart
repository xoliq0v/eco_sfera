import 'package:core/core.dart';

abstract class AuthUseCase {
  Future<Result<String>> login({
    required String login,
    required String password,
  });
}

abstract class Logout {
  Future<Result<bool>> logout();
}