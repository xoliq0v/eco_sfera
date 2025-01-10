import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/model.dart';
import 'package:network/network.dart';
import '../../../repository.dart';
import '../../mapping/customer_mapping.dart';
import '../../mapping/customer_response_mapper.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  CustomerRepositoryImpl({required this.customerProvider});

  final CustomerProvider customerProvider;

  @override
  Future<Result<BasePaginatedResponse<Customer>?>> fetchCustomers(CustomerGetModel request) {
    return toResult2(
      customerProvider.fetchCustomers(
        request.toCustomerGetRequestDTO(),
      ),
      fromSuccessResponse: (response) {
        return response.data?.toBasePaginatedResponse(contentMapper: (json) {
          final data = json as CustomerDto;
          return data.toCustomerModel();
        });
      },
    );

  }

  @override
  Future<Result<CustomerResponseModel>> postCustomer(CustomerPostModel customer) {
    return toResult2(
      customerProvider.postCustomer(customer.toCustomerPostDTO()),
      fromSuccessResponse: (data){
        return data.data!.toModel();
      }
    );
  }

  @override
  Future<Result<List<Customer>>> searchCustomer(String number) {
    return toResult2(
        customerProvider.searchCustomer(number),
        fromSuccessResponse: (response) => response.data!.map((item)=> item.toCustomerModel()).toList(),
    );
  }
}