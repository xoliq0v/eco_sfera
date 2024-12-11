import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/partner_dto.dart';

abstract class PartnerProvider extends BaseProvider {

  Future<ApiResponse<PartnerDto>> fetchPartners(int page, int size);

}