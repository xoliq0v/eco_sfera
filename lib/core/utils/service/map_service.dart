import 'package:eco_sfera/core/singleton/di.config.dart';
import 'package:injectable/injectable.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


@lazySingleton
class MapService {

  // YandexMapController get controller => YandexMapController;

  Future<void> initializeMap(YandexMapController controller) async {
    // Perform any necessary initialization here
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(target: Point(latitude: 55.751244, longitude: 37.618423), zoom: 14.0),
      ),
    );
  }
}