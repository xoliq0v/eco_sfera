import 'package:model/model.dart';
import 'package:use_case/src/user_use_case.dart';
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
  UserProfile? get() {
    return userRepository.getUserProfile();
  }

  @override
  Stream<UserProfile?> watch() {
    return userRepository.watchUserProfile();
  }

}