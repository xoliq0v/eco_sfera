import 'dart:async';

import 'package:core/core.dart';
import '../../map_service.dart';
import '../geocoding.dart';
import '../geolocator.dart';
import '../impl/geocoding_impl.dart';
import '../impl/geolocator_impl.dart';
import '../impl/location_service_impl.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';

@module
abstract class MapServiceModule {
  AppGeolocation provideAppGeolocation() {
    return AppGeolocationImpl();
  }

  @lazySingleton
  YandexGeocoder provideYandexGeocoder() {
    return YandexGeocoder(apiKey: '9fe51ba7-a93c-49ed-9fa3-5eb09444dd84');
  }

  AppGeocoding provideAppGeocoding(YandexGeocoder yandexGeocoder) {
    return AppGeocodingImpl(yandexGeocoder: yandexGeocoder);
  }

  LocationService provideLocationService(){
    return LocationServiceImpl();
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() async {
  AndroidYandexMap.useAndroidViewSurface = true;
}
