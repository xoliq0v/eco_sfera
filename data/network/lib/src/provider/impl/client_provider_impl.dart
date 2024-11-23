import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/client_data_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/client_provider.dart';

class ClientProviderImpl extends ClientProvider {
  ClientProviderImpl({required this.authClient});

  final Dio authClient;

  @override
  Future<ApiResponse<ClientDataDTO>> fetchData() {
    return apiCall(
      authClient.get(ClientEndpoint.clientData),
      dataFromJson: (data) {
        return ClientDataDTO.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<ApiResponse<Map<String, dynamic>?>> logout() {
    return apiCall(
      authClient.post(ClientEndpoint.logout),
      dataFromJson: (data) => data as Map<String, dynamic>?,
    );
  }

}