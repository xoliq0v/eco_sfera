import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import '../map_service_use_case.dart';

class CechPermissionWithoutRequestUseCaseImpl extends CheckPermissionWithoutRequestUseCase {
  CechPermissionWithoutRequestUseCaseImpl({
    required this.mapRepo
  });
  
  final MapRepo mapRepo;
  
  @override
  Future<bool> check() {
    return mapRepo.checkPermissionWithoutRequest();
  }
  
}

class CheckPermissionUseCaseImpl extends CheckPermissionUseCase {
  CheckPermissionUseCaseImpl({
    required this.mapRepo
  });

  final MapRepo mapRepo;

  @override
  Future<bool> check() {
    return mapRepo.checkPermission();
  }

}

class GetCurrentLocationUseCaseImpl extends GetCurrentLocationUseCase {
  GetCurrentLocationUseCaseImpl({
    required this.mapRepo
  });

  final MapRepo mapRepo;

  @override
  Future<Result<LongLat>> get() async {
    return mapRepo.getCurrentPosition();
  }

}