import 'package:core/core.dart';
import 'package:network/network.dart';

abstract class HistoryProvider extends BaseProvider {

  Future<ApiResponse<PageableContentDTO<HistoryDto>>> fetchHistory(int page,int size);

}