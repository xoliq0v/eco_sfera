import 'dart:developer';
import 'dart:io';

import 'package:model/model.dart';

import '../../../app_bloc.dart';
import 'package:core/core.dart';
import 'package:firebase_eco/firebase_eco.dart';
import 'package:use_case/use_case.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      this._authUseCase,
      this._saveToken,
      this._saveType,
      this._fetchUserProfile,
      ) : super(const AuthState.init());

  final AuthUseCase _authUseCase;
  final SaveToken _saveToken;
  final SaveType _saveType;
  final FetchUserProfile _fetchUserProfile;
  String _login = '';
  String _password = '';
  String? _deviceToken = '';

  Future<void> login({
    required String login,
    required String password,
  }) async {
    emit(const AuthState.loading());
    _login = login;
    _password = password;
    if(Platform.isAndroid){
      _deviceToken = await FirebaseMessaging.instance.getToken();
    }else{
      _deviceToken = await FirebaseMessaging.instance.getAPNSToken();
    }

    final result = await _authUseCase.login(
        login: login, password: password, deviceToken: _deviceToken!
    );

    if (result.status == Status.error || result.data == null) {
      emit(AuthState.error(result.error?.message ?? 'Something went wrong'));
      return;
    }

    try {
      log('Login response data: ${result.data!.type}');
      await _saveToken.save(result.data!.token!);
      await _saveType.save(result.data!.type!);
      await _fetchUserProfile.fetch();
      emit(AuthState.success(result.data!.type!));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  void retry() {
    login(login: _login, password: _password);
  }

  // Future<AuthType> getType() async{
  //   return await _getAuthType.get();
  // }

}