import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/partner_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/partner_provider.dart';

class PartnerProviderImpl extends PartnerProvider {
  PartnerProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<PartnerDto>> fetchPartners(int page, int size) {
    return apiCall(
        apiClient.get('${PartnerEndpoint.partners}?page=$page&per_page=$size'),
        dataFromJson: (data){
          return PartnerDto.fromJson(data as Map<String, dynamic>);
        }
    );
  }

}