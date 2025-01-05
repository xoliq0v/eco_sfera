import 'package:model/model.dart';

abstract class UserRepository{

  Future<int?> fetchUserInfo();

  DriverData? getUserProfile();

  Stream<DriverData?> watchUserProfile();
}