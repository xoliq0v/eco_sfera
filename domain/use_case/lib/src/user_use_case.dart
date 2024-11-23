import 'package:model/model.dart';

abstract class FetchUserProfile {
  Future<int?> fetch();
}

abstract class GetUserProfile {
  UserProfile? get();

  Stream<UserProfile?> watch();
}