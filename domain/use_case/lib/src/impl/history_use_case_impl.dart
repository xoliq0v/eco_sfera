import 'package:core/src/network_config/result_mapping.dart';
import 'package:model/src/base_paginated_response.dart';
import 'package:model/src/buy_page_prams_model.dart';
import 'package:repository/repository.dart';
import 'package:use_case/src/history_use_case.dart';

class FetchHistoryImpl extends FetchHistory {
  FetchHistoryImpl({required this.historyRepo});

  final HistoryRepo historyRepo;

  @override
  Future<Result<BasePaginatedResponse<HistoryModel>?>> fetch(int page, int size) {
    return historyRepo.fetchHistory(page, size);
  }

}