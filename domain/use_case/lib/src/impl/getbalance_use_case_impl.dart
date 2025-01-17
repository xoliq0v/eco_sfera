import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import '../../use_case.dart';
import '../getbalance_use_case.dart';

class GetBalanceImpl extends GetBalance {
  GetBalanceImpl({required this.driverrepo});

  final UserRepository driverrepo;

  @override
  Stream<double?> watch() {
    return driverrepo.watchBalance();
  }

  @override
  double? get() {
    return driverrepo.getBalance();
  }
}

class FetchBalanceImpl extends FetchBalance {
  FetchBalanceImpl({required this.userRepository});

  final UserRepository userRepository;

  @override
  Future<int?> fetch() {
    return userRepository.fetchBalance();
  }

}