import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';

import 'package:network/src/dto/route_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';

import '../route_provider.dart';

class RouteProviderImpl extends RouteProvider {
  RouteProviderImpl({required this.apiClient});
  
  final Dio apiClient;
  
  @override
  Future<ApiResponse<RouteDto>> fetchRoutes() {
    return apiCall(
        apiClient.get(RouteEndpoint.routes),
        dataFromJson: (data){
          return RouteDto.fromJson(data as Map<String, dynamic>);
        },
    );
  }
  
}