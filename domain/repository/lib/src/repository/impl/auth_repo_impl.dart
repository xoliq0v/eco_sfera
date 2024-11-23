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
  Future<Result<String>> login({required String login, required String password}) {
    return toResult2(
      authProvider.login(login: login,password: password),
      fromSuccessResponse: (response) {
        return response.data!;
      },
    );
  }

  @override
  Future<Result<bool>> logout() {
    return toResult2(
      clientProvider.logout(),
      fromSuccessResponse: (response) => response.data != null,
    );
  }



}