import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/model.dart';
import 'package:model/src/base_paginated_response.dart';
import 'package:model/src/customer_get.dart';
import 'package:repository/repository.dart';
import 'package:use_case/src/customer_use_case.dart';

class GetCustomersImpl implements GetCustomer {
  GetCustomersImpl({required this.customerRepository});

  final CustomerRepository customerRepository;

  @override
  Future<Result<BasePaginatedResponse<Customer>?>> get({required int page, required int size}) {
    return customerRepository.fetchCustomers(
      CustomerGetModel(page: page, size: size)
    );
  }

}

class PostCustomerImpl implements PostCustomer {
  PostCustomerImpl({required this.customerRepository});

  final CustomerRepository customerRepository;

  @override
  Future<Result<CustomerResponseModel>> post({required CustomerPostModel model}) {
    return customerRepository.postCustomer(model);
  }

}

class SearchCustomerImpl extends SearchCustomer {
  SearchCustomerImpl({required this.customerRepository});

  final CustomerRepository customerRepository;

  @override
  Future<Result<List<Customer>>> search(String number) {
    return customerRepository.searchCustomer(number);
  }

}