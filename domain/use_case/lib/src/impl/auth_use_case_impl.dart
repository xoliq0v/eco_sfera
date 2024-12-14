import 'package:core/core.dart';
import 'package:model/model.dart';
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
    required String deviceToken
  }) async {
    try {
      return await authRepository.login(auth: AuthModel(login: login, password: password, deviceToken: deviceToken));
    } catch (e) {
      return Result.error(ResultError(reason: e.toString(),message: e.toString()));
    }
  }
}

class LogoutImpl implements Logout {
  LogoutImpl({
    required this.sessionRepository,
  });

  final SessionRepository sessionRepository;

  @override
  Future<Result<bool>> logout() async {
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
}
