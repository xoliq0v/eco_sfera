import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/buy_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/buy_provider.dart';

class BuyProviderImpl extends BuyProvider {
  BuyProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<bool>> buy(BuyDto buyDto) {
    return apiCall(
        apiClient.post(BuyEndpoint.buy,data: buyDto.toJson()),
        dataFromJson: (json){
          return json != null;
        }
    );
  }

}