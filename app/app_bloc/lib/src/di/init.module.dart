//@GeneratedMicroModule;AppBlocPackageModule;package:app_bloc/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:app_bloc/app_bloc.dart' as _i3;
import 'package:app_bloc/src/bloc/order/handler.dart' as _i4;
import 'package:app_bloc/src/di/init.dart' as _i7;
import 'package:core/core.dart' as _i6;
import 'package:injectable/injectable.dart' as _i1;
import 'package:use_case/use_case.dart' as _i5;

class AppBlocPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final appBlocModule = _$AppBlocModule();
    gh.factory<_i3.ThemeChangerCubit>(
        () => appBlocModule.provideThemeChangCubit());
    gh.factory<_i4.FCMHandler>(() => appBlocModule.provideHandler());
    gh.factory<_i3.AuthCubit>(() => appBlocModule.provideAuthCubit(
          gh<_i5.AuthUseCase>(),
          gh<_i5.SaveToken>(),
          gh<_i5.SaveType>(),
          gh<_i5.FetchUserProfile>(),
        ));
    gh.factory<_i3.ActiveHistoryCubit>(
        () => appBlocModule.provideActiveHistory(gh<_i5.GetActiveHistory>()));
    gh.factory<_i3.InternetConnectivityController>(
        () => appBlocModule.provideInternetConnectivityController(
              gh<_i6.Connectivity>(),
              gh<_i6.InternetConnectionChecker>(),
            ));
    gh.factory<_i3.BuyCubit>(() => appBlocModule.provideBuyCubit(
          gh<_i5.Buy>(),
          gh<_i5.FetchBuyPageParams>(),
          gh<_i5.SearchCustomer>(),
          gh<_i5.GetUserProfile>(),
        ));
    gh.factory<_i3.PartnerPaginationCubit>(() =>
        appBlocModule.providePaginationPartnerCubit(gh<_i5.FetchPartners>()));
    gh.factory<_i3.LogoutCubit>(
        () => appBlocModule.provideLogOutCubit(gh<_i5.Logout>()));
    gh.factory<_i3.ProfileCubit>(() => appBlocModule.provideProfileCubit(
          gh<_i5.GetUserProfile>(),
          gh<_i5.FetchUserProfile>(),
          gh<_i5.GetToken>(),
          gh<_i5.GetAuthType>(),
          gh<_i5.FetchPartnerProfile>(),
          gh<_i5.GetPartnerProfile>(),
        ));
    gh.factory<_i3.PostCustomerCubit>(
        () => appBlocModule.providePostCustomerCubit(gh<_i5.PostCustomer>()));
    gh.factory<_i3.RegionCubit>(
        () => appBlocModule.provideRegionCubit(gh<_i5.GetRegions>()));
    gh.factory<_i3.HistoryPaginationCubit>(() =>
        appBlocModule.provideHistoryPaginationCubit(gh<_i5.FetchHistory>()));
    gh.factory<_i3.LocationServiceCubit>(
        () => appBlocModule.provideLocationCubit(gh<_i5.GetLocation>()));
    gh.factory<_i3.OrderCubit>(() => appBlocModule.provideOrderCubit(
          gh<_i5.GetOrder>(),
          gh<_i5.FCMTokenRefresh>(),
          gh<_i5.WatchPost>(),
        ));
    gh.factory<_i3.CustomerCubit>(
        () => appBlocModule.provideCustomerCubit(gh<_i5.GetCustomer>()));
    gh.factory<_i3.CustomerPaginationCubit>(() =>
        appBlocModule.provideCustomerPaginationCubit(gh<_i5.GetCustomer>()));
  }
}

class _$AppBlocModule extends _i7.AppBlocModule {}
