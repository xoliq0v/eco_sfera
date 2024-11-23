import 'dart:developer';

import 'package:core/core.dart' hide Map;
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/endpoints/endpoints.dart';

class AuthProviderImpl extends AuthProvider {
  AuthProviderImpl(this.apiClient);

  final Dio apiClient;

  @override
  Future<ApiResponse<String>> login({
    required String login,
    required String password,
  }) {
    return apiCall(
      apiClient.post(
        AuthEndpoint.base,
        data: {
          "login": login,
          "password": password
        },
      ),
      dataFromJson: (data) {
        log('Login response data: ${data['token']}'); // Added logging
        if (data is Map<String, dynamic>) {
          final token = data['token'];
          if (token != null) {
            return token.toString();
          }
        }
        throw const FormatException('Invalid response structure');
      },
    );
  }


}
