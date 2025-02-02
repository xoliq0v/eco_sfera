import 'package:core/core.dart';
import 'package:network/network.dart';

abstract class RouteProvider extends BaseProvider {
  Future<ApiResponse<RouteDto>> fetchRoutes();
}