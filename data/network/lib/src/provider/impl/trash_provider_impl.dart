import 'package:core/src/network_config/base_model.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/endpoints/endpoints.dart';

class TrashProviderImpl extends TrashProvider {
  TrashProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<List<TrashInfoDto>>> fetchTrashes() {
    return apiCall(
      apiClient.get(TrashEndpoint.trashes),
     dataFromJson: (data){
        return (data as List<dynamic>).map((json){
          return TrashInfoDto.fromJson(json as Map<String, dynamic>);
        }).toList();
     }
    );
  }
  
  @override
  Future<ApiResponse<List<PartnerTrashDto>>> fetchPartnerTrashes() {
    return apiCall(
      apiClient.get(TrashEndpoint.partnerTrashes),
      dataFromJson: (data) {
        return (data as List<dynamic>).map((json) => PartnerTrashDto.fromJson(json as Map<String, dynamic>)).toList();
      }
    );
  }

  @override
  Future<ApiResponse<bool>> changeTrashPrice(int trashId, String price) {
    return apiCall(
      apiClient.put(
        TrashEndpoint.changeTrashPrice, 
        data: {
          'price': price,
          'product_id': trashId,
        }
      ),
      dataFromJson: (data) {
        return data != null;
      }
    );
  }

  @override
  Future<ApiResponse<bool>> addComment(int productId, String comment) {
    return apiCall(
      apiClient.post(TrashEndpoint.addComment, 
        data: {'product_id': productId, 'description': comment}
      ),
      dataFromJson: (data) {
        return data != null;
      }
    );
  }

}