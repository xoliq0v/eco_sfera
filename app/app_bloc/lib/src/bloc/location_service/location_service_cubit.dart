import 'dart:async';

import '../../../app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';
import 'package:geolocator/geolocator.dart';

part 'location_service_cubit.freezed.dart';
part 'location_service_state.dart';

class LocationServiceCubit extends Cubit<LocationServiceState> {
  LocationServiceCubit(this._getLocation) : super(const LocationServiceState.init());

  final GetLocation _getLocation;

  Future<void> init() async {
    emit(const LocationServiceState.init());
    await _checkAndRequestPermission();
  }

  Future<void> _checkAndRequestPermission() async {
    final status = await Permission.location.status;

    if (status.isDenied) {
      final result = await Permission.location.request();
      if (result.isGranted) {
        await getLocation();
      } else {
        emit(LocationServiceState.error(
            LocationException('Location permission denied')
        ));
      }
    } else if (status.isPermanentlyDenied) {
      emit(LocationServiceState.error(
          LocationException('Location permission permanently denied. Please enable in settings.')
      ));
    } else if (status.isGranted) {
      await getLocation();
    }
  }

  Future<bool> getLocation() async {
    emit(const LocationServiceState.loading());

    try {
      // Check if location service is enabled
      final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        emit(LocationServiceState.error(
            LocationException('Location services are disabled. Please enable location services.')
        ));
        return false;
      }

      // Get location with timeout
      final result = await _getLocation.get().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw LocationException('Location request timed out. Please try again.');
        },
      );

      emit(LocationServiceState.success(result));
      return true;
    } on LocationException catch (e) {
      emit(LocationServiceState.error(e));
    } on TimeoutException {
      emit(LocationServiceState.error(
          LocationException('Location request timed out. Please try again.')
      ));
    } catch (e) {
      emit(LocationServiceState.error(
          LocationException('Failed to get location: ${e.toString()}')
      ));
    }
    return false;
  }

  Future<void> retryLocation() async {
    final permissionStatus = await Permission.location.status;

    if (permissionStatus.isGranted) {
      await getLocation();
    } else {
      await _checkAndRequestPermission();
    }
  }
}

class LocationException implements Exception {
  final String message;
  LocationException(this.message);

  @override
  String toString() => message;
}