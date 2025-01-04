import 'dart:developer';

import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/requests/customer_post_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';

class CustomerProviderImpl extends CustomerProvider {
  CustomerProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<PageableContentDTO<CustomerDto>>> fetchCustomers(CustomerGetRequestDTO request) {
    return apiCall(
      apiClient.get(
        '${CustomerEndpoint.customers}?page=${request.page}&per_page=${request.size}',
      ),
      dataFromJson: (data) {
        log('Received data: $data');

        // Check if data is a List
        if (data is List) {
          // If data is a list of customers, parse it
          return PageableContentDTO.fromJson(
            {
              'data': data,
              'current_page': 1,  // Default to 1 if no pagination info is provided
              'per_page': request.size,
              'total': data.length,  // Assuming total is the length of the data
              'last_page': 1,  // Default to 1 if no pagination info is provided
            },
                (json) => CustomerDto.fromJson(json as Map<String, dynamic>),
          );
        }

        // Handle unexpected response structure (e.g., missing data or pagination)
        log('Error: Unexpected data format received');
        return PageableContentDTO<CustomerDto>(
          data: [],
          currentPage: 0,
          perPage: 0,
          total: 0,
          lastPage: 0,
        );
      },
    );
  }


  @override
  Future<ApiResponse<CustomerResponseDto>> postCustomer(CustomerPostDTO request) {
    return apiCall(
        apiClient.post(
            CustomerEndpoint.customers,
            data: request.toJson(),
        ),
        dataFromJson: (data){
          log('DATA ${data['user']}');
          return CustomerResponseDto.fromJson(data['user'] as Map<String,dynamic>);
        },
    );
  }
}
