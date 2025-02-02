import 'package:core/core.dart';
import 'package:model/model.dart';
import '../../../repository.dart';
import 'package:map_service/map_service.dart';

class MapRepositoryImpl implements MapRepo {
  MapRepositoryImpl({
    required this.appGeolocation,
    required this.appGeocoding,
  });

  final AppGeolocation appGeolocation;
  final AppGeocoding appGeocoding;

  @override
  Future<Result<String?>> getCurrentAddress({
    required LongLat position,
  }) async {
    final res = await appGeocoding.getCurrentAddress(
      long: position.long,
      lat: position.lat,
    );
    if (res.success) return Result.completed(res.data);
    return Result.error(
      ResultError(
        message: res.error?.message ?? 'something is wrong getCurrentAddress',
        reason: res.error?.reason ?? 'something is wrong',
      ),
    );
  }

  @override
  Future<Result<LongLat>> getCurrentPosition() async {
    final res = await appGeolocation.getCurrentLocation();
    if (res.success) {
      return Result.completed(LongLat(
        long: res.data!.long,
        lat: res.data!.lat,
      ));
    }
    return Result.error(
      ResultError(
        message: res.error?.message ?? 'something is wrong getCurrentPosition',
        reason: res.error?.reason ?? 'something is wrong',
      ),
    );
  }

  @override
  Future<bool> checkPermission() async {
    try {
      final res = await appGeolocation.checkPermission();
      return res.data ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> checkPermissionWithoutRequest() async {
    try {
      final res = await appGeolocation.checkPermissionWithoutRequest();
      return res;
    } catch (e) {
      return false;
    }
  }
}
