import 'dart:async';

import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:database/src/storage/impl/app_storage_impl.dart';
import 'package:database/src/storage/impl/secure_storage_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<SharedPreferences> prefs() => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage provideFlutterSecureStorage() {
    return const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  @preResolve
  Future<MyObjectBox> provideMyObjectBox() {
    return MyObjectBox.create();
  }

  @lazySingleton
  AppStorage provideAppStorage(SharedPreferences sharedPreferences) {
    return AppStorageImpl(sharedPreferences: sharedPreferences);
  }

  @lazySingleton
  SecureStorage provideSecureStorage(
    FlutterSecureStorage flutterSecureStorage,
  ) {
    return SecureStorageImpl(flutterSecureStorage: flutterSecureStorage);
  }

  @lazySingleton
  UserLocationDAO provideUserLocationDAO(MyObjectBox myObjectBox) {
    return UserLocationDAO(myObjectBox.store);
  }

  @lazySingleton
  UserProfileDAO provideUserProfileDAO(MyObjectBox myObjectBox) {
    return UserProfileDAO(myObjectBox.store);
  }

  @lazySingleton
  DrugSearchDAO provideDrugSearchDAO(MyObjectBox myObjectBox) {
    return DrugSearchDAO(myObjectBox.store);
  }

  @lazySingleton
  FavoriteDetectorDAO provideFavoriteDetectorDAO(MyObjectBox myObjectBox) {
    return FavoriteDetectorDAO(myObjectBox.store);
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}