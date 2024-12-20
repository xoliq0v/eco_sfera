import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

abstract class CustomerRepository extends BaseRepository {

  Future<Result<BasePaginatedResponse<Customer>?>> fetchCustomers(CustomerGetModel request);

  Future<Result<bool>> postCustomer(CustomerPostModel customer);

}