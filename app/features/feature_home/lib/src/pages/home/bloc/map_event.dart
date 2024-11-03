import 'package:yandex_mapkit/yandex_mapkit.dart';

abstract class MapEvent {}
class MapCreated extends MapEvent {
  final YandexMapController controller;
  MapCreated(this.controller);
}
