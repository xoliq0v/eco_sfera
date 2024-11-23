
import 'dart:async';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

@module
abstract class AppBlocModule {

  InternetConnectivityController provideInternetConnectivityController(
      Connectivity connectivity,
      InternetConnectionChecker internetConnectionChecker,
      ) {
    return InternetConnectivityController(
      connectivity,
      internetConnectionChecker,
    );
  }

  AuthCubit provideAuthCubit(
      AuthUseCase authUseCase,
      SaveToken saveSession,
      FetchUserProfile fetchUserProfile,){
    return AuthCubit(authUseCase, saveSession, fetchUserProfile);
  }

}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
