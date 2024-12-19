import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/trash_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/trash_provider.dart';

class TrashProviderImpl extends TrashProvider {
  TrashProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<List<TrashDto>>> fetchTrashes() {
    return apiCall(
      apiClient.get(TrashEndpoint.trashes),
     dataFromJson: (data){
        return (data as List<dynamic>).map((json){
          return TrashDto.fromJson(json as Map<String, dynamic>);
        }).toList();
     }
    );
  }

}