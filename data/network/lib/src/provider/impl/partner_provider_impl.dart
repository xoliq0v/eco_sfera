import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/src/dto/partner_dto.dart';
import 'package:network/src/dto/partner_info_dto.dart';
import 'package:network/src/dto/requests/announcement_dto.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/partner_provider.dart';

import 'package:network/network.dart';

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
          final data = json as List<dynamic>;
          return data.map((e) => ProductDto.fromJson(e as Map<String, dynamic>)).toList();
        },
    );
  }

  @override
  Future<ApiResponse<bool>> changeStatus(bool status) {
    return apiCall(
      apiClient.put(PartnerEndpoint.changeStatus, data: {'status': 'accepted'}),
      dataFromJson: (data) {
        return data != null;
      },
    );
  }

  @override
  Future<ApiResponse<bool>> editPartner(PartnerEditDto partnerEditDto) {
    return apiCall(
      apiClient.put(PartnerEndpoint.editPartner, data: partnerEditDto.toJson()),
      dataFromJson: (data) {
        return data != null;
      },
    );
  }

  @override
  Future<ApiResponse<PartnerDataDto>> getPartnerData(int id) {
    return apiCall(
      apiClient.get(PartnerEndpoint.info,queryParameters: {'id': id}),
      dataFromJson: (data) => PartnerDataDto.fromJson(data as Map<String, dynamic>),
    );
  }

  @override
  Future<ApiResponse<bool>> createOrder(SubmissionDto submissionDto) {
    return apiCall(
      apiClient.post(PartnerEndpoint.createOrder, data: submissionDto.toJson()),
      dataFromJson: (data) => data != null,
    );
  }

  @override
  Future<ApiResponse<List<CommentDto>>> getComments() {
    return apiCall(
      apiClient.get(PartnerEndpoint.comments),
      dataFromJson: (json) {
        final data = json as List<dynamic>;
        return data.map((e) => CommentDto.fromJson(e as Map<String, dynamic>)).toList();
      },
    );
  }

  @override
  Future<ApiResponse<bool>> postAd(AnnouncementDto dto) {
    return apiCall(
      apiClient.post(PartnerEndpoint.postAd, data: dto.toJson()),
      dataFromJson: (data) => data != null,
    );
  }
}
