import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class UserRepository{

  Future<int?> fetchUserInfo();

  DriverData? getUserProfile();

  Stream<DriverData?> watchUserProfile();

  Future<Result<TransactionsResponse>> getTransactions();

  Future<int?> fetchBalance();

  Stream<double?> watchBalance();

  double? getBalance();
}