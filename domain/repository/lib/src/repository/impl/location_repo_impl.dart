import 'package:map_service/map_service.dart';
import 'package:model/src/location_entity.dart';
import '../../../repository.dart';
import '../../mapping/location_mapping.dart';

class LocationRepoImpl extends LocationRepository {
  LocationRepoImpl({required this.locationService});

  final LocationService locationService;

  @override
  Future<LocationEntity> getCurrentLocation() async{

    final result = await locationService.fetchCurrentLocation();

    return result.toLocationEntity();

  }

}