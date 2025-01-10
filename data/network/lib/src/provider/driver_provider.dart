import 'package:core/core.dart' hide Map;
import 'package:network/network.dart';

abstract class ClientProvider extends BaseProvider {

  Future<ApiResponse<DriverDTO>> fetchData();

  Future<ApiResponse<Map<String, dynamic>?>> logout();

  Future<ApiResponse<bool>> refreshFCMToken(String token);

}
