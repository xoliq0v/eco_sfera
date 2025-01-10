import 'package:core/src/network_config/base_model.dart';
import 'package:database/database.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/driver_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/driver_provider.dart';

class ClientProviderImpl extends ClientProvider {
  ClientProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<DriverDTO>> fetchData() {
    return apiCall(
      apiClient.get(DriverEndpoint.clientData),
      dataFromJson: (data) {
        return DriverDTO.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<ApiResponse<Map<String, dynamic>?>> logout() async {
    return apiCall(
      apiClient.post(
        DriverEndpoint.logout,
      ),
      dataFromJson: (data) => data as Map<String, dynamic>?,
      errorDataFromJson: (errorData) {
        if (errorData is Map<String, dynamic>) {
          return errorData;
        }
        return null;
      },
    );
  }

  @override
  Future<ApiResponse<bool>> refreshFCMToken(String token) {
    return apiCall(
        apiClient.post(
            DriverEndpoint.refreshFCMToken,
            data: {
              'device_token': token,
            },
        ),
        dataFromJson: (data)=> data != null,
    );
  }
}
