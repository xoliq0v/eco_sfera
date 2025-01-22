import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/partner_dto.dart';
import 'package:network/src/dto/partner_info_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/partner_provider.dart';

import '../../../network.dart';

class PartnerProviderImpl extends PartnerProvider {
  PartnerProviderImpl({required this.apiClient});

  final Dio apiClient;


  /// Function for drivers to fetch partners from the API
  @override
  Future<ApiResponse<PageableContentDTO<PartnerDto>>> fetchPartners(int page, int size) {
    return fetchPaginatedData(
        request: apiClient.get('${PartnerEndpoint.partners}?page=$page&per_page=$size'),
        itemFromJson: PartnerDto.fromJson,
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


  @override
  Future<ApiResponse<List<ProductDto>>> getAllProducts() {
    return apiCall(
        apiClient.get(PartnerEndpoint.products),
        dataFromJson: (json) {
          final data = json['data'] as List<dynamic>;
          return data.map((e) => ProductDto.fromJson(e as Map<String, dynamic>)).toList();
        }
    );
  }
}