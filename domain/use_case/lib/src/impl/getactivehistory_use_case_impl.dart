import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import '../getactivehistory_use_case.dart';

class GetActiveHistoryImpl extends GetActiveHistory {
  GetActiveHistoryImpl({required this.historyrepo});

  final HistoryRepo historyrepo;

  @override
  Future<Result<BasePaginatedResponse<ActiveHistory>?>> get(int page, int size) {
    return historyrepo.getActiveHistory(page,size);
  }
}