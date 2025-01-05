import 'package:core/core.dart';
import 'package:network/network.dart';

abstract class TrashProvider extends BaseProvider {

  Future<ApiResponse<List<TrashInfoDto>>> fetchTrashes();

}