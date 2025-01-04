import 'dart:developer';

import 'package:core/core.dart' hide Map;
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/endpoints/endpoints.dart';

class AuthProviderImpl extends AuthProvider {
  AuthProviderImpl(this.apiClient);

  final Dio apiClient;

  @override
  Future<ApiResponse<AuthResDTO>> login({
    required AuthDTO auth,
  }) {
    return apiCall(
      apiClient.post(
        AuthEndpoint.base,
        data: {
          'login': auth.login,
          'password': auth.password,
          'device_token': auth.deviceToken,
        },
      ),
      dataFromJson: (data) {
        log('Login response data: $data');
        if (data is Map<String, dynamic>) {
          return AuthResDTO.fromJson(data);
        }
        throw const FormatException('Invalid response structure');
      },
      errorDataFromJson: (data) {
        log('Error response data: $data');
        if (data is Map<String, dynamic> && data.containsKey('message')) {
          throw data['message'] as String;
        }
        throw 'Unknown error occurred';
      },
    );
  }
}