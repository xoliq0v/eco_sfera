
import 'dart:async';

import 'package:core/core.dart';
import 'package:repository/repository.dart';
import 'package:use_case/src/impl/auth_use_case_impl.dart';
import 'package:use_case/src/impl/session_use_case_impl.dart';
import 'package:use_case/use_case.dart';

@module
abstract class UseCaseModule {

  AuthUseCase provideAuthUseCase(AuthRepository authRepository){
    return AuthImpl(authRepository: authRepository);
  }

  SaveToken provideSaveSession(SessionRepository sessionRepository){
    return SaveTokenImpl(sessionRepository: sessionRepository);
  }

  GetToken provideGetToken(SessionRepository sessionRepository){
    return GetTokenImpl(sessionRepository: sessionRepository);
  }

  FetchUserProfile provideFetchUserProfile(UserRepository userRepository){
    return FetchUserProfileImpl(userRepository: userRepository);
  }

  GetUserProfile provideGetUserProfile(UserRepository userRepository){
    return GetUserProfileImpl(userRepository: userRepository);
  }

  Logout provideLogout(SessionRepository sessionRepository){
    return LogoutImpl(sessionRepository: sessionRepository);
  }

}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
