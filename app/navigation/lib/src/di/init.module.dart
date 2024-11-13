//@GeneratedMicroModule;NavigationPackageModule;package:navigation/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:injectable/injectable.dart' as _i1;
import 'package:navigation/navigation.dart' as _i3;
import 'package:navigation/src/di/init.dart' as _i6;
import 'package:navigation/src/navigation/auth_navigation.dart' as _i5;
import 'package:navigation/src/routes/auth_routes.dart' as _i4;

class NavigationPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final navigationModule = _$NavigationModule();
    gh.singleton<_i3.AppRouter>(() => navigationModule.provideAppRoute());
    gh.lazySingleton<_i3.MainRoutes>(
        () => navigationModule.provideMainRoutes());
    gh.lazySingleton<_i4.AuthRoutes>(
        () => navigationModule.provideAuthRoutes());
    gh.lazySingleton<_i3.MainNavigation>(
        () => navigationModule.provideMainNavigator(gh<_i3.AppRouter>()));
    gh.lazySingleton<_i5.AuthNavigation>(
        () => navigationModule.provideAuthNavigator(gh<_i3.AppRouter>()));
  }
}

class _$NavigationModule extends _i6.NavigationModule {}
