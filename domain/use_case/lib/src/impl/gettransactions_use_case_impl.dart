import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import '../gettransactions_use_case.dart';

class GetTransactionsImpl extends GetTransactions {
  GetTransactionsImpl({required this.driverrepo});

  final UserRepository driverrepo;

  @override
  Future<Result<TransactionsResponse>> get() {
    return driverrepo.getTransactions();
  }
}