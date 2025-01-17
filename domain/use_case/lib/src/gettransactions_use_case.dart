import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class GetTransactions {
  Future<Result<TransactionsResponse>> get();
}