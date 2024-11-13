//@GeneratedMicroModule;MapServicePackageModule;package:map_service/src/di/init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:map_service/src/di/init.dart' as _i907;
import 'package:map_service/src/geocoding.dart' as _i775;
import 'package:map_service/src/geolocator.dart' as _i786;

class MapServicePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final mapServiceModule = _$MapServiceModule();
    gh.factory<_i786.AppGeolocation>(
        () => mapServiceModule.provideAppGeolocation());
    gh.lazySingleton<_i494.YandexGeocoder>(
        () => mapServiceModule.provideYandexGeocoder());
    gh.factory<_i775.AppGeocoding>(
        () => mapServiceModule.provideAppGeocoding(gh<_i494.YandexGeocoder>()));
  }
}

class _$MapServiceModule extends _i907.MapServiceModule {}
