import 'package:core/core.dart' hide Map;
import 'package:network/network.dart';
import 'package:network/src/dto/client_data_dto.dart';
import 'package:network/src/provider/base_provider.dart';

abstract class ClientProvider extends BaseProvider {
  Future<ApiResponse<ClientDataDTO>> fetchData();

  Future<ApiResponse<Map<String, dynamic>?>> logout();
}
