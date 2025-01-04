import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class GetCustomer {

  Future<Result<BasePaginatedResponse<Customer>?>> get({
    required int page,
    required int size,
  });

}

abstract class PostCustomer {

  Future<Result<CustomerResponseModel>> post({required CustomerPostModel model});

}