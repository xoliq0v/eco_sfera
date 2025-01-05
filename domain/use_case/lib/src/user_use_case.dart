import 'package:model/model.dart';

abstract class FetchUserProfile {
  Future<int?> fetch();
}

abstract class GetUserProfile {
  DriverData? get();

  Stream<DriverData?> watch();
}