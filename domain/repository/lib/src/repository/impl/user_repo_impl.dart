import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/model.dart';
import '../../mapping/driver_mapper.dart';
import '../user_repo.dart';
import 'package:database/database.dart';
import 'package:network/network.dart';

import '../../mapping/transaction_mapper.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.userProfileDAO,
    required this.clientProvider,
    required this.balanceDao,
  });

  final ClientProvider clientProvider;
  final UserProfileDAO userProfileDAO;
  final BalanceDao balanceDao;

  @override
  Future<int?> fetchUserInfo() async {
    final res = await clientProvider.fetchData();
    if (res.data == null) return null;
    return userProfileDAO.saveProfile(
      res.data!.toUserProfileEntity(),
    );
  }

  @override
  DriverData? getUserProfile() {
    return userProfileDAO.getProfile()?.toUserProfile();
  }

  @override
  Stream<DriverData?> watchUserProfile() {
    return userProfileDAO.watchProfile().map((event) {
      return event?.toUserProfile();
    });
  }

  @override
  Future<Result<TransactionsResponse>> getTransactions() async{
    final response = await clientProvider.getTransactions();

    try {
      if (!response.success || response.data == null) {
        return Result.error(
          ResultError(
            message: response.error?.message ?? 'Something went wrong',
            reason: response.error?.reason ?? 'Something went wrong',
          ),
        );
      }

      return Result.completed(response.data?.toModel());
    }catch(e){
      return Result.error(
        ResultError(
          message: 'Authentication failed',
          reason: e.toString(),
        ),
      );
    }
  }

  @override
  Future<int?> fetchBalance() async{
    final res = await clientProvider.getBalance();
    // if (res.data == null) return null;
    return balanceDao.saveBalance(
      res.data??0
    );
  }

  @override
  Stream<double?> watchBalance() {
    return balanceDao.watchBalance();
  }

  @override
  double? getBalance() {
    return balanceDao.getBalance();
  }

}