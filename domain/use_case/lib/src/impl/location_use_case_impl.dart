import 'package:model/src/location_entity.dart';
import 'package:repository/repository.dart';
import '../location_use_case.dart';

class GetLocationImpl extends GetLocation {
  GetLocationImpl({required this.locationRepository});

  final LocationRepository locationRepository;

  @override
  Future<LocationEntity> get() {
    return locationRepository.getCurrentLocation();
  }

}