import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class CheckPermissionWithoutRequestUseCase{

  Future<bool> check();

}

abstract class CheckPermissionUseCase {

  Future<bool> check();

}

abstract class GetCurrentLocationUseCase {

  Future<Result<LongLat>> get();

}