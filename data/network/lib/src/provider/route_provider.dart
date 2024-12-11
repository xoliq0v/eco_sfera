import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/route_dto.dart';

abstract class RouteProvider extends BaseProvider {
  Future<ApiResponse<RouteDto>> fetchRoutes();
}