import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/trash_dto.dart';

abstract class TrashProvider extends BaseProvider {

  Future<ApiResponse<TrashDto>> fetchTrashes();

}