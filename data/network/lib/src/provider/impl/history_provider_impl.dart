import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/endpoints/endpoints.dart';

class HistoryProviderImpl extends HistoryProvider {
  HistoryProviderImpl({required this.apiClient});

  final Dio apiClient;

  @override
  Future<ApiResponse<PageableContentDTO<HistoryDto>>> fetchHistory(int page,int size){
    return fetchPaginatedData(
        request: apiClient.get(
          '${HistoryEndpoint.history}?page=$page&per_page=$size',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ),
        itemFromJson: HistoryDto.fromJson,
    );
  }



  @override
  Future<ApiResponse<PageableContentDTO<ActiveHistoryDto>>> getActiveHistory(int page,int size) {
    return fetchPaginatedData(
        request: apiClient.get(
            HistoryEndpoint.active,
            queryParameters: {
              'page': page,
              'size': size,
            },
        ), itemFromJson: ActiveHistoryDto.fromJson,

    );
  }
}