import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import '../geolocator.dart';

class AppGeolocationImpl implements AppGeolocation {
  @override
  Future<ApiResponse<bool>> checkPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw NotPermissionLocation();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw NotPermissionLocation();
    }
    return ApiResponse(true, success: true);
  }

  @override
  Future<ApiResponse<({double long, double lat})>> getCurrentLocation() async {
    final hasPermission = await checkPermission();
    if (hasPermission.data != true) {
      return ApiResponse(
        null,
        error: hasPermission.error,
        success: false,
      );
    }
    try {
      final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 5),
      );
      return ApiResponse(
        (
        long: currentPosition.longitude,
        lat: currentPosition.latitude,
        ),
        success: true,
      );
    } catch (e) {
      debugPrint('Error getCurrentLocation $e');
      return ApiResponse(
        null,
        error: ApiResponseError(message: '$e', reason: 'GetCurrentPosition'),
        success: false,
      );
    }
  }

  @override
  Future<bool> checkPermissionWithoutRequest() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    debugPrint('permission $permission');
    switch (permission) {
      case LocationPermission.denied:
        return false;
      case LocationPermission.deniedForever:
        return false;
      case LocationPermission.whileInUse:
        return true;
      case LocationPermission.always:
        return true;
      case LocationPermission.unableToDetermine:
        return true;
    }
  }
}
