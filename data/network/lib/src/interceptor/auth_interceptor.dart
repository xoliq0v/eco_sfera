import 'dart:developer';

import 'package:database/database.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this.secureStorage,
  });

  final SecureStorage secureStorage;

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    log('AuthInterceptor.onRequest called for ${options.path}');

    final token = await secureStorage.getToken();
    log('Retrieved token: ${token ?? 'null'}');

    if (token == null) {
      log('No token found, proceeding without authorization');
      return handler.next(options);
    }

    log('Adding Authorization header with Bearer token');
    options.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    // Make sure to call handler.next instead of super.onRequest
    return handler.next(options);
  }
}