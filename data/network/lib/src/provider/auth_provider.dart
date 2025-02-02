import 'package:core/core.dart' hide Map;
import 'package:network/network.dart';

abstract class AuthProvider extends BaseProvider {
  Future<ApiResponse<AuthResDTO>> login({
    required AuthDTO auth,
  });
}
