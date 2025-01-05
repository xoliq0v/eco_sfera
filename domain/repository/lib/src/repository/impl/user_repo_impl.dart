import 'package:model/model.dart';
import 'package:repository/src/mapping/driver_mapper.dart';
import 'package:repository/src/repository/user_repo.dart';
import 'package:database/database.dart';
import 'package:network/network.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.userProfileDAO,
    required this.clientProvider,
  });

  final ClientProvider clientProvider;
  final UserProfileDAO userProfileDAO;

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



}