import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';
import '../mixin/pagination.dart';

part 'active_history_pagination_state.dart';

class ActiveHistoryCubit extends Cubit<ActiveHistoryPaginationState> with PaginationCubitWrapper{
  ActiveHistoryCubit(
        this._fetchHistory,{required int initialPageSize,}
      ):super(const ActiveHistoryPaginationState()){
    localInitialPageSize = initialPageSize;
    fetchHistory();
  }


  final GetActiveHistory _fetchHistory;

  Future<bool?> fetchHistory() async {
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    if (!isLoaded) emit(state.copyWith(isLoadingShimmer: true));
    if (isLoaded && state.history.isNotEmpty) {
      emit(state.copyWith(isLoadingPagination: true));
    }
    return _fetch();
  }

  Future<bool?> refresh() async {
    if (state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    localCurrentPage = 0;
    return _fetch(isRefresh: true);
  }

  Future<bool> _fetch({
    bool isRefresh = false,
  }) async {
    final res = await _fetchHistory.get(
      localCurrentPage,
      localPageSize,
    );
    switch (res.status) {
      case Status.completed:
        final history = res.data?.content ?? [];
        isLastPage = history.length < localPageSize;
        isLoaded = true;
        if (res.data?.pagination.total != null) {
          isLastPage = res.data!.pagination.total - 1 == localCurrentPage;
        }
        if (!isLastPage) localCurrentPage += 1;
        if (isRefresh) {
          emit(state.copyWith(customers: history));
        } else {
          emit(state.copyWith(customers: [
            ...state.history,
            ...history,
          ]));
        }
        return true;
      case Status.error:
        if (state.isLoadingPagination) {
          emit(state.copyWith(errorPagination: res.error?.message ?? ''));
        } else {
          emit(state.copyWith(error: res.error?.message ?? ''));
        }
        return false;
    }
  }

}