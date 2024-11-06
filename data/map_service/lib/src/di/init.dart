import 'dart:async';

import 'package:core/core.dart';
import 'package:map_service/src/geocoding.dart';
import 'package:map_service/src/geolocator.dart';
import 'package:map_service/src/impl/geocoding_impl.dart';
import 'package:map_service/src/impl/geolocator_impl.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;

@module
abstract class MapServiceModule {
  // AppGeolocation provideAppGeolocation() {
  //   return AppGeolocationImpl();
  // }

  // @lazySingleton
  // YandexGeocoder provideYandexGeocoder() {
  //   return YandexGeocoder(apiKey: '9fe51ba7-a93c-49ed-9fa3-5eb09444dd84');
  // }

  // AppGeocoding provideAppGeocoding(YandexGeocoder yandexGeocoder) {
  //   return AppGeocodingImpl(yandexGeocoder: yandexGeocoder);
  // }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() async {
  await init.initMapkit(
      apiKey: '9fe51ba7-a93c-49ed-9fa3-5eb09444dd84'
  );
}
