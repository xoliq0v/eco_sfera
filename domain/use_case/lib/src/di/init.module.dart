//@GeneratedMicroModule;UseCasePackageModule;package:use_case/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:repository/repository.dart' as _i585;
import 'package:use_case/src/di/init.dart' as _i854;
import 'package:use_case/src/impl/auth_use_case_impl.dart' as _i627;
import 'package:use_case/use_case.dart' as _i987;

class UseCasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final useCaseModule = _$UseCaseModule();
    gh.factory<_i987.FetchHistory>(
        () => useCaseModule.provideFetchHistory(gh<_i585.HistoryRepo>()));
    gh.factory<_i987.FetchUserProfile>(() =>
        useCaseModule.provideFetchUserProfile(gh<_i585.UserRepository>()));
    gh.factory<_i987.GetUserProfile>(
        () => useCaseModule.provideGetUserProfile(gh<_i585.UserRepository>()));
    gh.factory<_i987.SaveToken>(
        () => useCaseModule.provideSaveSession(gh<_i585.SessionRepository>()));
    gh.factory<_i987.GetToken>(
        () => useCaseModule.provideGetToken(gh<_i585.SessionRepository>()));
    gh.factory<_i987.Logout>(
        () => useCaseModule.provideLogout(gh<_i585.SessionRepository>()));
    gh.factory<_i627.AuthImpl>(
        () => _i627.AuthImpl(authRepository: gh<_i585.AuthRepository>()));
    gh.factory<_i987.AuthUseCase>(
        () => useCaseModule.provideAuthUseCase(gh<_i585.AuthRepository>()));
    gh.factory<_i987.GetCustomer>(
        () => useCaseModule.provideGetCustomer(gh<_i585.CustomerRepository>()));
    gh.factory<_i987.PostCustomer>(() =>
        useCaseModule.providePostCustomer(gh<_i585.CustomerRepository>()));
    gh.factory<_i987.Buy>(() => useCaseModule.provideBuy(gh<_i585.BuyRepo>()));
    gh.factory<_i987.FetchBuyPageParams>(
        () => useCaseModule.provideBuyPageParams(gh<_i585.BuyRepo>()));
    gh.factory<_i987.GetLocation>(
        () => useCaseModule.provideGetLocation(gh<_i585.LocationRepository>()));
    gh.factory<_i987.GetOrder>(
        () => useCaseModule.provideGetOrder(gh<_i585.OrderRepo>()));
  }
}

class _$UseCaseModule extends _i854.UseCaseModule {}
