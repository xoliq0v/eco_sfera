import 'dart:async';

import 'package:alice/alice.dart';
import 'package:core/core.dart' hide Duration;
import 'package:database/database.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:network/src/interceptor/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio(
      AuthInterceptor authInterceptor,
      BaseOptions baseOptions,
      Alice alice,
      ) {
    final dio = Dio(baseOptions);
    return dio
      ..interceptors.addAll(
        [
          authInterceptor,
          if (!kReleaseMode)
            PrettyDioLogger(requestHeader: true, requestBody: true),
          alice.getDioInterceptor(),
        ],
      );
  }

  @lazySingleton
  @Named('auth_dio')
  Dio provideAuthDio(
      AuthInterceptor authInterceptor,
      Alice alice,
      BaseOptions baseOptions,
      ) {
    final dio = Dio(baseOptions);
    return dio
      ..interceptors.addAll(
        [
          authInterceptor,
          if (!kReleaseMode)
            PrettyDioLogger(requestHeader: true, requestBody: true),
          alice.getDioInterceptor(),
        ],
      );
  }

  BaseOptions provideBaseOptions(@Named('base_url') String baseUrl) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
  }

  @lazySingleton
  AuthInterceptor provideAuthInterceptor(
      SecureStorage secureStorage,
      AppStorage appStorage,
      ) {
    return AuthInterceptor(
      secureStorage: secureStorage,
    );
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
