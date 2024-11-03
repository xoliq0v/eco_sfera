import 'package:model/model.dart';
import 'package:core/core.dart';

abstract class MapRepo {

  Future<Result<String?>> getCurrentAddress({
    required LongLat position,
  });

  Future<Result<LongLat>> getCurrentPosition();

  Future<bool> checkPermission();

  Future<bool> checkPermissionWithoutRequest();

}