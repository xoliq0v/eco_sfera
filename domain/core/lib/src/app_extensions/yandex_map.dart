// import 'package:core/core.dart';
// import 'package:geolocator/geolocator.dart';
//
// extension GoogleMapControllerExt on GoogleMapController {
//   Future<void> moveToLocation({
//     required double longitude,
//     required double latitude,
//     required bool withAnimation,
//   }) async {
//     final cameraPosition = CameraPosition(
//       target: LatLng(latitude, longitude),
//     ).defaultPosition();
//     final cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);
//     if (withAnimation) {
//       return animateCamera(cameraUpdate);
//     }
//     return moveCamera(cameraUpdate);
//   }
//
//   Future<bool> checkPermission() async {
//     final status = await Geolocator.checkPermission();
//     switch (status) {
//       case LocationPermission.denied:
//         return false;
//       case LocationPermission.deniedForever:
//         return false;
//       case LocationPermission.whileInUse:
//         return true;
//       case LocationPermission.always:
//         return true;
//       case LocationPermission.unableToDetermine:
//         return true;
//     }
//   }
// }
//
// extension CameraPositionExt on CameraPosition {
//   CameraPosition defaultPosition() {
//     return CameraPosition(
//       target: target,
//       zoom: 17,
//       tilt: 45,
//     );
//   }
// }
