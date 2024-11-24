import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';

mixin AppBlocHelper {
  static InternetConnectivityController getInternetConnectivityController() {
    return GetIt.I.get<InternetConnectivityController>();
  }

  static AuthCubit getAuthCubit() {
    return GetIt.I.get<AuthCubit>();
  }

  static ProfileCubit getProfileCubit(){
    return GetIt.I.get<ProfileCubit>();
  }

  static LogoutCubit provideLogOutCubit(){
    return GetIt.I.get<LogoutCubit>();
  }

  static LogoutCubit getLogoutCubit(){
    return GetIt.I.get<LogoutCubit>();
  }
}