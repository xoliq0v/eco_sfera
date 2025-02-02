import 'package:model/model.dart';
import '../user_use_case.dart';
import 'package:repository/repository.dart';

class FetchUserProfileImpl extends FetchUserProfile {
  FetchUserProfileImpl({required this.userRepository});

  final UserRepository userRepository;

  @override
  Future<int?> fetch() {
    return userRepository.fetchUserInfo();
  }
}

class GetUserProfileImpl extends GetUserProfile {
  GetUserProfileImpl({required this.userRepository});

  final UserRepository userRepository;

  @override
  DriverData? get() {
    return userRepository.getUserProfile();
  }

  @override
  Stream<DriverData?> watch() {
    return userRepository.watchUserProfile();
  }

}