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
    final token = await secureStorage.getToken();
    if (token == null) {
      return handler.next(options);
    }
    print('jasco: $token');
    options.headers.addAll({
      'Authorization': 'Bearer $token',
    });
    super.onRequest(options, handler);
  }
}
