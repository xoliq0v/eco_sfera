import 'package:core/core.dart';

abstract class AppGeocoding {
  Future<ApiResponse<String?>> getCurrentAddress({
    required double long,
    required double lat,
  });
}