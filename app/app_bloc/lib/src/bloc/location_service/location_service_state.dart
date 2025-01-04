
part of 'location_service_cubit.dart';

@freezed
sealed class LocationServiceState with _$LocationServiceState {

  const factory LocationServiceState.init() = _Init;

  const factory LocationServiceState.loading() = _Loading;

  const factory LocationServiceState.success(LocationEntity location) = _Success;

  const factory LocationServiceState.error(dynamic error) = _Error;

}