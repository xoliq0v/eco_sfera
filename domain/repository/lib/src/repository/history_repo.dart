import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';

abstract class HistoryRepo extends BaseRepository {

  Future<Result<BasePaginatedResponse<HistoryModel>?>> fetchHistory(int page,int size);


  Future<Result<BasePaginatedResponse<ActiveHistory>?>> getActiveHistory(int page,int size);
}