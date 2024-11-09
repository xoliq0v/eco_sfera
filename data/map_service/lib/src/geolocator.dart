import 'package:core/core.dart';

abstract class AppGeolocation {
  Future<bool> checkPermissionWithoutRequest();

  Future<ApiResponse<bool>> checkPermission();

  Future<ApiResponse<({double long, double lat})>> getCurrentLocation();
}