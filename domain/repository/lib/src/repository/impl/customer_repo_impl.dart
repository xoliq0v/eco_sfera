import 'dart:developer';

import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/model.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/mapping/customer_mapping.dart';
import 'package:repository/src/mapping/customer_response_mapper.dart';
import 'package:repository/src/repository/customer_repo.dart';
import 'package:repository/src/mapping/pageable_content_mapping.dart';

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

}