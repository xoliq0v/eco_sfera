import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/endpoints/endpoints.dart';
import 'package:network/src/provider/history_provider.dart';

class HistoryProviderImpl extends HistoryProvider {
  HistoryProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<PageableContentDTO<HistoryDto>>> fetchHistory(int page,int size){
    return apiCall(
        apiClient.get(
          '${HistoryEndpoint.history}?page=${page}&per_page=${size}',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            }
          )
        ),
        dataFromJson: (json){
          if (json is List) {
            // If data is a list of customers, parse it
            return PageableContentDTO.fromJson(
              {
                'data': json,
                'current_page': 1,  // Default to 1 if no pagination info is provided
                'per_page': size,
                'total': json.length,  // Assuming total is the length of the data
                'last_page': 1,  // Default to 1 if no pagination info is provided
              },
                  (json) => HistoryDto.fromJson(json! as Map<String, dynamic>),
            );
          }

          return PageableContentDTO<HistoryDto>(
            data: [],
            currentPage: 0,
            perPage: 0,
            total: 0,
            lastPage: 0,
          );
        }
    );
  }


}