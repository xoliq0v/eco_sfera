part of 'get_region_cubit.dart';

@freezed
sealed class RegionState with _$RegionState {

  const factory RegionState.init() = _Init;

  const factory RegionState.loading() = _Loading;

  const factory RegionState.success(List<Region> regions) = _Success;

  const factory RegionState.error(String error) = _Error;

}