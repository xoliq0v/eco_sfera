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
          // Check if data is null or not a list
          if (data == null || data is! List) {
            return <OrderDto>[];
          }

          // Safely map and filter out any invalid items
          return data
              .whereType<Map<String, dynamic>>()
              .map(OrderDto.fromJson)
              .toList();
        }
    );
  }
}