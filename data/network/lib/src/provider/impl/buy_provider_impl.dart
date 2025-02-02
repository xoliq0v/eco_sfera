import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/buy_provider.dart';

import 'package:network/network.dart';

class BuyProviderImpl extends BuyProvider {
  BuyProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<BuyCheckDto>> buy(BuyReqDto buyDto) {
    return apiCall(
        apiClient.post(BuyEndpoint.buy,data: buyDto.toJson()),
        dataFromJson: (json){
          final res = json as List<dynamic>;
          return BuyCheckDto.fromJson(res[0] as Map<String, dynamic>);

        },
    );
  }

}