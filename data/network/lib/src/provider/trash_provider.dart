import 'package:core/core.dart';
import 'package:network/network.dart';

abstract class TrashProvider extends BaseProvider {

  Future<ApiResponse<List<TrashInfoDto>>> fetchTrashes();

  Future<ApiResponse<List<PartnerTrashDto>>> fetchPartnerTrashes();

  Future<ApiResponse<bool>> changeTrashPrice(int trashId, String price);

  Future<ApiResponse<bool>> addComment(int productId, String comment);
}
