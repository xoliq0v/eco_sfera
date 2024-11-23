import 'dart:developer';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      this._authUseCase, this._saveToken, this._fetchUserProfile
      ) : super(const AuthState.init());

  final AuthUseCase _authUseCase;
  final SaveToken _saveToken;
  final FetchUserProfile _fetchUserProfile;
  String _login = '';
  String _password = '';

  Future<void> login({
    required String login,
    required String password,
  }) async {
    emit(const AuthState.loading());
    _login = login;
    _password = password;
    final res = await _authUseCase.login(login: login,password: password);
    if (res.data == true) {
      emit(AuthState.error(res.error?.message ?? 'something is wrong'));
      return;
    }
    _saveToken.save(res.data!);
    await _fetchUserProfile.fetch();
    emit(const AuthState.success());
  }

  void retry() {
    login(login: _login,password: _password);
  }
}
