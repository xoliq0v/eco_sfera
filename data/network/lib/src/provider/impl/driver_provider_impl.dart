import 'dart:developer';

import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/driver_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/driver_provider.dart';

class ClientProviderImpl extends ClientProvider {
  ClientProviderImpl({required this.authClient});

  final Dio authClient;

  @override
  Future<ApiResponse<DriverDTO>> fetchData() {
    return apiCall(
      authClient.get(DriverEndpoint.clientData),
      dataFromJson: (data) {
        log('ClientProviderImpl fetchData $data');
        return DriverDTO.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<ApiResponse<Map<String, dynamic>?>> logout() {
    return apiCall(
      authClient.post(DriverEndpoint.logout),
      dataFromJson: (data) => data as Map<String, dynamic>?,
    );
  }

}
