import 'package:model/model.dart';

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation();
}