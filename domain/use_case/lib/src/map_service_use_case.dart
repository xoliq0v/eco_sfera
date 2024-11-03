abstract class CheckLocationPermission{
  Future<bool> checkPermissionWithoutRequest();

  Future<bool> checkPermission();
}