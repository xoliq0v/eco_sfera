import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/src/base_paginated_response.dart';
import 'package:model/src/buy_page_prams_model.dart';
import 'package:network/network.dart';
import 'package:repository/src/mapping/history_mapper.dart';
import 'package:repository/src/repository/history_repo.dart';
import 'package:repository/src/mapping/pageable_content_mapping.dart';

class HistoryRepoImpl extends HistoryRepo {
  HistoryRepoImpl({required this.historyProvider});

  final HistoryProvider historyProvider;

  @override
  Future<Result<BasePaginatedResponse<HistoryModel>?>> fetchHistory(int page,int size) {
    return toResult2(
      historyProvider.fetchHistory(
        page,size
      ),
      fromSuccessResponse: (response) {
        return response.data?.toBasePaginatedResponse(contentMapper: (json) {
          final data = json as HistoryDto;
          return data.toModel();
        });
      },
    );
  }

}