import 'package:core/core.dart';
import 'package:network/network.dart';

abstract class CustomerProvider extends BaseProvider {
  Future<ApiResponse<PageableContentDTO<CustomerDto>>> fetchCustomers(CustomerGetRequestDTO request);
  Future<ApiResponse<CustomerResponseDto>> postCustomer(CustomerPostDTO request);
  Future<ApiResponse<List<CustomerDto>>> searchCustomer(String number);
}