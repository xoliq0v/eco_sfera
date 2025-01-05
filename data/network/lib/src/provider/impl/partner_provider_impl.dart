import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/partner_dto.dart';
import 'package:network/src/dto/partner_info_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/partner_provider.dart';

class PartnerProviderImpl extends PartnerProvider {
  PartnerProviderImpl({required this.apiClient});

  final Dio apiClient;


  /// Function for drivers to fetch partners from the API
  @override
  Future<ApiResponse<PartnerDto>> fetchPartners(int page, int size) {
    return apiCall(
        apiClient.get('${PartnerEndpoint.partners}?page=$page&per_page=$size'),
        dataFromJson: (data){
          return PartnerDto.fromJson(data as Map<String, dynamic>);
        },
    );
  }


  /// Function for partner to fetch their data from the API
  @override
  Future<ApiResponse<PartnerInfoDto>> fetchPartnerData() {
    return apiCall(
        apiClient.get(PartnerEndpoint.data),
        dataFromJson: (data){
          return PartnerInfoDto.fromJson(data as Map<String, dynamic>);
        },
    );
  }
}