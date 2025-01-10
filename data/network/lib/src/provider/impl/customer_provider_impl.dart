import 'dart:developer';

import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/endpoints/endpoints.dart';

class CustomerProviderImpl extends CustomerProvider {
  CustomerProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<PageableContentDTO<CustomerDto>>> fetchCustomers(CustomerGetRequestDTO request) {
    return fetchPaginatedData(
      request: apiClient.get(
        CustomerEndpoint.customers,
        queryParameters: {
          'page': request.page,
          'per_page': request.size,
        },
      ),
      itemFromJson: CustomerDto.fromJson,
    );
  }


  @override
  Future<ApiResponse<CustomerResponseDto>> postCustomer(CustomerPostDTO request) {
    return apiCall(
        apiClient.post(
            CustomerEndpoint.customers,
            data: request.toJson(),
        ),
        dataFromJson: (data) {
          log('DATA ${data['user']}');
          return CustomerResponseDto.fromJson(data['user'] as Map<String,dynamic>);
        },
    );
  }

  @override
  Future<ApiResponse<List<CustomerDto>>> searchCustomer(String number) {
    return apiCall(
        apiClient.get(
            CustomerEndpoint.search,
          queryParameters: {
            'search': number
          }
        ),
        dataFromJson: (data) => (data as List<dynamic>).map((item)=> CustomerDto.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}
