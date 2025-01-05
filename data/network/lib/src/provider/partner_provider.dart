import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/partner_dto.dart';

import '../dto/partner_info_dto.dart';

abstract class PartnerProvider extends BaseProvider {


  /// For driver app
  Future<ApiResponse<PartnerDto>> fetchPartners(int page, int size);


  /// For partner app
  Future<ApiResponse<PartnerInfoDto>> fetchPartnerData();

}