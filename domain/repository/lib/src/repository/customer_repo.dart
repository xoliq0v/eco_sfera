import 'package:core/core.dart';
import 'package:model/model.dart';
import '../../repository.dart';

abstract class CustomerRepository extends BaseRepository {

  Future<Result<BasePaginatedResponse<Customer>?>> fetchCustomers(CustomerGetModel request);

  Future<Result<CustomerResponseModel>> postCustomer(CustomerPostModel customer);

  Future<Result<List<Customer>>> searchCustomer(String number);


  Future<Result<List<Region>>> getRegions();
}