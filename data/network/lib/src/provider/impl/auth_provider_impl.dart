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
          "password": password,
        },
      ),
      dataFromJson: (data) {
        log('Login response data: $data');
        if (data is Map<String, dynamic>) {
          final token = data['token'];
          if (token != null) {
            return token.toString();
          }
        }
        throw const FormatException('Invalid response structure');
      },
      errorDataFromJson: (data) {
        log('Error response data: $data');
        if (data is Map<String, dynamic> && data.containsKey('message')) {
          return data['message'] as String;
        }
        return 'Unknown error occurred';
      },
    );
  }
}