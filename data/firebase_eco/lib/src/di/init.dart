import 'dart:async';

import 'package:core/core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../messaging_service.dart';

@module
abstract class FirebaseModule {
  @lazySingleton
  FirebaseAnalytics provideFirebaseAnalytics() {
    return FirebaseAnalytics.instance;
  }

  @lazySingleton
  FirebaseCrashlytics provideFirebaseCrashlytics() {
    return FirebaseCrashlytics.instance;
  }

  @lazySingleton
  FirebaseMessaging provideFirebaseMessaging() {
    return FirebaseMessaging.instance;
  }

  @lazySingleton
  FirebaseNotificationService provideNotificationService(
      FirebaseMessaging messaging,
      ) {
    return FirebaseNotificationService(firebaseMessaging: messaging);
  }

  @preResolve
  Future<void> initializeCrashlytics(FirebaseCrashlytics crashlytics) async {
    // Enable crash reporting
    await crashlytics.setCrashlyticsCollectionEnabled(true);

    // Pass all uncaught errors to Crashlytics
    if (!kDebugMode) {
      FlutterError.onError = crashlytics.recordFlutterError;
    }
  }

  @preResolve
  Future<void> initializeNotificationService(
      FirebaseNotificationService notificationService,
      ) async {
    await notificationService.initNotifications();
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}