import 'package:core/core.dart';
import 'package:network/network.dart';

abstract class CustomerProvider extends BaseProvider {
  Future<ApiResponse<CustomerDto>> fetchCustomers(CustomerGetRequestDTO request);
  Future<ApiResponse<bool>> postCustomer(CustomerPostDTO request);
}