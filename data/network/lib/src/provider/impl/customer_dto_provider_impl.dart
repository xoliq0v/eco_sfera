import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/requests/customer_post_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';

class CustomerProviderImpl extends CustomerProvider {
  CustomerProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<CustomerDto>> fetchCustomers(CustomerGetRequestDTO request) {
    return apiCall(
      apiClient.get(
          '${CustomerEndpoint.customers}?page=${request.page}&per_page=${request.size}',
      ),
      dataFromJson: (data) {
        return CustomerDto.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<ApiResponse<bool>> postCustomer(CustomerPostDTO request) {
    return apiCall(
        apiClient.post(
            CustomerEndpoint.customers,
            data: request.toJson(),
        ),
        dataFromJson: (data){
          return data != null;
        },
    );
  }
}
