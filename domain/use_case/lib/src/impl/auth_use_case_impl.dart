import 'package:core/core.dart';
import 'package:repository/repository.dart' hide Logout;
import 'package:use_case/use_case.dart';

@injectable
class AuthImpl implements AuthUseCase {
  AuthImpl({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Result<String>> login({
    required String login,
    required String password,
  }) {
    return authRepository.login(login: login, password: password);
  }
}

class LogoutImpl implements Logout {
  LogoutImpl({
    required this.authRepository,
    required this.sessionRepository,
  });

  final AuthRepository authRepository;
  final SessionRepository sessionRepository;

  @override
  Future<Result<bool>> logout() async {
    final res = await authRepository.logout();
    if (res.data ?? false) {
      try {
        await sessionRepository.closeSession();
        return Result.completed(true);
      } catch (e) {
        return Result.error(const ResultError(
          message: 'SomethingWentWrong',
          reason: 'CloseSession',
        ));
      }
    }
    return Result.error(res.error);
  }
}
