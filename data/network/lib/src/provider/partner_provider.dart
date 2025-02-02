import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/requests/announcement_dto.dart';


abstract class PartnerProvider extends BaseProvider {


  /// For driver app
  Future<ApiResponse<PageableContentDTO<PartnerDto>>> fetchPartners(int page, int size);


  /// For partner app
  Future<ApiResponse<PartnerInfoDto>> fetchPartnerData();


  Future<ApiResponse<List<ProductDto>>> getAllProducts();

  Future<ApiResponse<bool>> changeStatus(bool status,);

  Future<ApiResponse<bool>> editPartner(PartnerEditDto partnerEditDto);

  Future<ApiResponse<PartnerDataDto>> getPartnerData(int id);

  Future<ApiResponse<bool>> createOrder(SubmissionDto submissionDto);

  Future<ApiResponse<List<CommentDto>>> getComments();

  Future<ApiResponse<bool>> postAd(AnnouncementDto dto);

}
