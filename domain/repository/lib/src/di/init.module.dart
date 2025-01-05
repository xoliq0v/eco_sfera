//@GeneratedMicroModule;RepositoryPackageModule;package:repository/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:database/database.dart' as _i252;
import 'package:injectable/injectable.dart' as _i526;
import 'package:map_service/map_service.dart' as _i200;
import 'package:network/network.dart' as _i372;
import 'package:repository/repository.dart' as _i585;
import 'package:repository/src/di/init.dart' as _i49;

class RepositoryPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final repositoryModule = _$RepositoryModule();
    gh.lazySingleton<_i585.PartnerRepo>(
        () => repositoryModule.providePartnerRepository(
              gh<_i372.PartnerProvider>(),
              gh<_i252.PartnerProfileDAO>(),
            ));
    gh.lazySingleton<_i585.SessionRepository>(
        () => repositoryModule.provideSessionRepository(
              gh<_i252.AppStorage>(),
              gh<_i252.SecureStorage>(),
              gh<_i252.MyObjectBox>(),
            ));
    gh.lazySingleton<_i585.BuyRepo>(() => repositoryModule.provideBuyRepository(
          gh<_i372.BuyProvider>(),
          gh<_i372.TrashProvider>(),
        ));
    gh.lazySingleton<_i585.HistoryRepo>(() =>
        repositoryModule.provideHistoryRepository(gh<_i372.HistoryProvider>()));
    gh.lazySingleton<_i585.OrderRepo>(() =>
        repositoryModule.provideOrderRepository(gh<_i372.OrderProvider>()));
    gh.lazySingleton<_i585.LocationRepository>(() => repositoryModule
        .provideLocationRepository(gh<_i200.LocationService>()));
    gh.lazySingleton<_i585.AuthRepository>(
        () => repositoryModule.provideAuthRepository(
              gh<_i372.AuthProvider>(),
              gh<_i372.ClientProvider>(),
            ));
    gh.lazySingleton<_i585.CustomerRepository>(() => repositoryModule
        .provideCustomerRepository(gh<_i372.CustomerProvider>()));
    gh.lazySingleton<_i585.UserRepository>(
        () => repositoryModule.provideUserRepository(
              gh<_i372.ClientProvider>(),
              gh<_i252.UserProfileDAO>(),
            ));
  }
}

class _$RepositoryModule extends _i49.RepositoryModule {}
