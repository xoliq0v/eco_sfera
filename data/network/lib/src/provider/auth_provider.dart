import 'package:core/core.dart' hide Map;
import 'package:network/network.dart';
import 'package:network/src/provider/base_provider.dart';

abstract class AuthProvider extends BaseProvider {
  Future<ApiResponse<String>> login({
    required AuthDTO auth,
  });
}
