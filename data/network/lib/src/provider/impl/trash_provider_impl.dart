import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/trash_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/trash_provider.dart';

class TrashProviderImpl extends TrashProvider {
  TrashProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<TrashDto>> fetchTrashes() {
    return apiCall(
      apiClient.get(TrashEndpoint.trashes),
     dataFromJson: (data){
        return TrashDto.fromJson(data as Map<String, dynamic>);
     }
    );
  }

}