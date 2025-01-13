import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/partner_dto.dart';


abstract class PartnerProvider extends BaseProvider {


  /// For driver app
  Future<ApiResponse<PageableContentDTO<PartnerDto>>> fetchPartners(int page, int size);


  /// For partner app
  Future<ApiResponse<PartnerInfoDto>> fetchPartnerData();

}