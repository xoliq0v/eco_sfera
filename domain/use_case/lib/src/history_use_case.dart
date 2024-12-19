import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class FetchHistory{

  Future<Result<BasePaginatedResponse<HistoryModel>?>> fetch(int page,int size);

}