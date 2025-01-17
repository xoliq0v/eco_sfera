//@GeneratedMicroModule;DatabasePackageModule;package:database/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:database/database.dart' as _i4;
import 'package:database/src/di/init.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

class DatabasePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    final databaseModule = _$DatabaseModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => databaseModule.prefs(),
      preResolve: true,
    );
    await gh.factoryAsync<_i4.MyObjectBox>(
      () => databaseModule.provideMyObjectBox(),
      preResolve: true,
    );
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => databaseModule.provideFlutterSecureStorage());
    gh.lazySingleton<_i4.UserLocationDAO>(
        () => databaseModule.provideUserLocationDAO(gh<_i4.MyObjectBox>()));
    gh.lazySingleton<_i4.UserProfileDAO>(
        () => databaseModule.provideUserProfileDAO(gh<_i4.MyObjectBox>()));
    gh.lazySingleton<_i4.DrugSearchDAO>(
        () => databaseModule.provideDrugSearchDAO(gh<_i4.MyObjectBox>()));
    gh.lazySingleton<_i4.FavoriteDetectorDAO>(
        () => databaseModule.provideFavoriteDetectorDAO(gh<_i4.MyObjectBox>()));
    gh.lazySingleton<_i4.PartnerProfileDAO>(
        () => databaseModule.providePartnerProfileDAO(gh<_i4.MyObjectBox>()));
    gh.lazySingleton<_i4.BalanceDao>(
        () => databaseModule.provideBalanceDAO(gh<_i4.MyObjectBox>()));
    gh.lazySingleton<_i4.SecureStorage>(() =>
        databaseModule.provideSecureStorage(gh<_i5.FlutterSecureStorage>()));
    gh.lazySingleton<_i4.AppStorage>(
        () => databaseModule.provideAppStorage(gh<_i3.SharedPreferences>()));
  }
}

class _$DatabaseModule extends _i6.DatabaseModule {}
