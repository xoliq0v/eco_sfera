import 'dart:developer';

import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/order_dto.dart';
import 'package:network/src/dto/pageable_content_dto.dart';
import 'package:network/src/dto/partner_order_dto.dart';
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
          final dataList = data is List ? data : [data];

          // Convert and filter out any invalid items
          return dataList
              .whereType<Map<String, dynamic>>()
              .map((item) => OrderDto.fromJson(item as Map<String, dynamic>))
              .toList();
        },
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

  @override
  Future<ApiResponse<PageableContentDTO<PartnerOrderDto>>> getPartnerOrders(int page, int size, String status) {
    return fetchPaginatedData(
        request: apiClient.get(
          PartnerEndpoint.order,
          queryParameters: {
            'page': page,
            'per_page': size,
            'status': status,
          },
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ),
        itemFromJson: PartnerOrderDto.fromJson,
    );
  }

  @override
  Future<ApiResponse<bool>> changeOrderStatus(int id, String status) {
    return apiCall(
      apiClient.post(OrderEndpoint.changeStatus, data: {
        'order_id': id,
        'status': status,
      },),
      dataFromJson: (data) => data != null,
    );
  }

}