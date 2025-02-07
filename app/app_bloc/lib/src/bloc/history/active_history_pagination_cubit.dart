import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_bloc.dart';
import '../mixin/pagination.dart';

part 'active_history_pagination_state.dart';

class ActiveHistoryCubit extends Cubit<ActiveHistoryPaginationState> with PaginationCubitWrapper {
  ActiveHistoryCubit(
    this._fetchHistory, {
    required int initialPageSize,
  }) : super(const ActiveHistoryPaginationState()) {
    localInitialPageSize = initialPageSize;
    fetchHistory();
  }

  final GetActiveHistory _fetchHistory;

  Future<bool?> fetchHistory() async {
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    if (!isLoaded) {
      emit(state.copyWith(isLoadingShimmer: true));
    }
    if (isLoaded && state.history.isNotEmpty) {
      emit(state.copyWith(isLoadingPagination: true));
    }
    return _fetchActive();
  }

  Future<bool?> refresh() async {
    if (state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    localCurrentPage = 0;
    return _fetchActive(isRefresh: true);
  }

  Future<bool> _fetchActive({
    bool isRefresh = false,
  }) async {
    try {
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
          
          emit(state.copyWith(
            customers: isRefresh ? history : [...state.history, ...history],
            isLoadingShimmer: false,
            isLoadingPagination: false,
            error: '',
            errorPagination: '',
          ));
          
          return true;
          
        case Status.error:
          emit(state.copyWith(
            error: state.isLoadingPagination ? '' : (res.error?.message ?? ''),
            errorPagination: state.isLoadingPagination ? (res.error?.message ?? '') : '',
            isLoadingShimmer: false,
            isLoadingPagination: false,
          ));
          
          return false;
      }
    } catch (e) {
      emit(state.copyWith(
        error: state.isLoadingPagination ? '' : e.toString(),
        errorPagination: state.isLoadingPagination ? e.toString() : '',
        isLoadingShimmer: false,
        isLoadingPagination: false,
      ));
      
      return false;
    }
  }
}