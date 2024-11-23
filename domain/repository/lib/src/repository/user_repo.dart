import 'package:model/model.dart';

abstract class UserRepository{

  Future<int?> fetchUserInfo();

  UserProfile? getUserProfile();

  Stream<UserProfile?> watchUserProfile();
}