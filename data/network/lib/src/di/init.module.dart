//@GeneratedMicroModule;NetworkPackageModule;package:network/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:alice/alice.dart' as _i6;
import 'package:database/database.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:injectable/injectable.dart' as _i1;
import 'package:network/network.dart' as _i7;
import 'package:network/src/di/init.dart' as _i8;
import 'package:network/src/di/provider_module.dart' as _i9;
import 'package:network/src/interceptor/auth_interceptor.dart' as _i4;

class NetworkPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    final networkProvidersModule = _$NetworkProvidersModule();
    gh.factory<_i3.BaseOptions>(() =>
        networkModule.provideBaseOptions(gh<String>(instanceName: 'base_url')));
    gh.lazySingleton<_i4.AuthInterceptor>(
        () => networkModule.provideAuthInterceptor(
              gh<_i5.SecureStorage>(),
              gh<_i5.AppStorage>(),
            ));
    gh.lazySingleton<_i3.Dio>(() => networkModule.provideDio(
          gh<_i4.AuthInterceptor>(),
          gh<_i3.BaseOptions>(),
          gh<_i6.Alice>(),
        ));
    gh.lazySingleton<_i3.Dio>(
      () => networkModule.provideAuthDio(
        gh<_i4.AuthInterceptor>(),
        gh<_i6.Alice>(),
        gh<_i3.BaseOptions>(),
      ),
      instanceName: 'auth_dio',
    );
    gh.lazySingleton<_i7.AuthProvider>(
        () => networkProvidersModule.provideAuthProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.ClientProvider>(
        () => networkProvidersModule.provideClientProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.CustomerProvider>(
        () => networkProvidersModule.provideCustomerProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.PartnerProvider>(
        () => networkProvidersModule.providePartnerProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.TrashProvider>(
        () => networkProvidersModule.provideTrashProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.RouteProvider>(
        () => networkProvidersModule.provideRouteProvider(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.OrderProvider>(
        () => networkProvidersModule.provideOrderProvider(gh<_i3.Dio>()));
  }
}

class _$NetworkModule extends _i8.NetworkModule {}

class _$NetworkProvidersModule extends _i9.NetworkProvidersModule {}
