import 'package:map_service/map_service.dart';
import 'package:model/model.dart';

extension LocationMapping on Position {

  LocationEntity toLocationEntity(){
    return LocationEntity(latitude: latitude, longitude: longitude);
  }

}