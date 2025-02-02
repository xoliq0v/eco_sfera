import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';




extension YandexMapExt on YandexMapController {

  Future<void> moveCurrentLocation() async{

  }

  Future<void> zoomIn()async{
    this.moveCamera(
      CameraUpdate.zoomIn(),
      animation: const MapAnimation(
        duration: 0.3,
        type: MapAnimationType.smooth,
      ),
    );
  }

  Future<void> zoomOut()async{
    this.moveCamera(
        CameraUpdate.zoomOut(),
        animation: const MapAnimation(
          duration: 0.3,
          type: MapAnimationType.linear,
        ),
    );
  }

}