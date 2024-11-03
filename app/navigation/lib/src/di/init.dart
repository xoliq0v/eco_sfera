
import 'dart:async';

import 'package:core/core.dart';
import 'package:navigation/navigation.dart';
import 'package:navigation/src/navigation/auth_navigation.dart';
import 'package:navigation/src/navigation/impl/auth_navigation_impl.dart';
import 'package:navigation/src/routes/auth_routes.dart';
import 'package:navigation/src/routes/impl/auth_routes_impl.dart';
import 'package:navigation/src/routes/impl/main_routes_impl.dart';
import 'package:navigation/src/routes/main_routes.dart';

import '../app_router.dart';

@module
abstract class NavigationModule{

  @singleton
  AppRouter provideAppRoute() {
    return AppRouter();
  }

  @lazySingleton
  MainRoutes provideMainRoutes() => MainRoutesImpl();

  @lazySingleton
  MainNavigation provideMainNavigator(AppRouter appRouter) {
    return MainNavigationImpl(appRouter: appRouter);
  }

  @lazySingleton
  AuthNavigation provideAuthNavigator(AppRouter appRouter) {
    return AuthNavigationImpl(appRouter: appRouter);
  }

  @lazySingleton
  AuthRoutes provideAuthRoutes() => AuthRoutesImpl();
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
