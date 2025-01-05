import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/endpoints/endpoints.dart';

class TrashProviderImpl extends TrashProvider {
  TrashProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<List<TrashInfoDto>>> fetchTrashes() {
    return apiCall(
      apiClient.get(TrashEndpoint.trashes),
     dataFromJson: (data){
        return (data as List<dynamic>).map((json){
          return TrashInfoDto.fromJson(json as Map<String, dynamic>);
        }).toList();
     }
    );
  }

}