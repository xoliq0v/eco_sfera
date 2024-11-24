import 'package:network/network.dart';
import 'package:core/src/network_config/result_mapping.dart';
import 'package:repository/src/repository/auth_repo.dart';


class AuthRepoImpl extends AuthRepository{
  AuthRepoImpl({
    required this.authProvider,
    required this.clientProvider,
  });

  final AuthProvider authProvider;
  final ClientProvider clientProvider;

  @override
  Future<Result<String>> login({required String login, required String password}) async {
    try {
      final response = await authProvider.login(login: login, password: password);

      if (!response.success || response.data == null) {
        return Result.error(
          ResultError(
            message: response.error?.message ?? 'Invalid login or password',
            reason: response.error?.reason ?? 'Authentication failed',
          ),
        );
      }

      return Result.completed(response.data);
    } catch (e) {
      return Result.error(
        ResultError(
          message: 'Authentication failed',
          reason: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Result<bool>> logout() {
    return toResult2(
      clientProvider.logout(),
      fromSuccessResponse: (response) => response.data != null,
    );
  }

}