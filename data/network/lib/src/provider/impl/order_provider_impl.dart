import 'dart:developer';

import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/order_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/orders_provider.dart';

class OrderProviderImpl extends OrderProvider {
  OrderProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<List<OrderDto>>> getOrders() {
    return apiCall(
        apiClient.get(OrderEndpoint.orders),
        dataFromJson: (dynamic data) {

          if (data == null) {
            return <OrderDto>[];
          }

          // Ensure we're working with a list
          final List dataList = data is List ? data : [data];

          // Convert and filter out any invalid items
          return dataList
              .where((item) => item is Map<String, dynamic>)
              .map((item) => OrderDto.fromJson(item as Map<String, dynamic>))
              .toList();
        }
    );
  }

  @override
  Future<ApiResponse<bool>> watch(int id){
    try{
      return apiCall(
          apiClient.post(
            OrderEndpoint.watch,
            data: {
              'order_id': id,
            },
          ),
          dataFromJson: (data) => data != null,
      );
    }catch(e){
      throw e.toString();
    }
  }

}