//@GeneratedMicroModule;FirebaseEcoPackageModule;package:firebase_eco/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:firebase_eco/src/messaging_service.dart' as _i228;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:injectable/injectable.dart' as _i526;

class FirebaseEcoPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i228.FirebaseNotificationService>(() =>
        _i228.FirebaseNotificationService(
            firebaseMessaging: gh<_i892.FirebaseMessaging>()));
  }
}
