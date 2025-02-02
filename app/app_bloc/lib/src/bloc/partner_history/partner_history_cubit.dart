import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';
import '../mixin/pagination.dart';

part 'partner_history_state.dart';

class PartnerHistoryCubit extends Cubit<PartnerHistoryState>
    with PaginationCubitWrapper {
  PartnerHistoryCubit(
        this._fethchPartnerOrders, GetAuthType getType, {
        required int initialPageSize,
    }) : super(const PartnerHistoryState()){
    localInitialPageSize = initialPageSize;
  }

  final GetPartnerOrdersUseCase _fethchPartnerOrders;

  void _fetchWithoutLoading(){
    localCurrentPage = 0;
    _fetch();
  }

  Future<bool?> fetchPartnerHistory() async {
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    if (!isLoaded) emit(state.copyWith(isLoadingShimmer: true));
    if (isLoaded && state.partnerOrdersHistory.isNotEmpty) {
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
    final res = await _fethchPartnerOrders.getPartnerOrders(
      localCurrentPage,
      localPageSize,
      'accepted',
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
          emit(state.copyWith(partnerOrdersHistory: history));
        } else {
          emit(state.copyWith(partnerOrdersHistory: [
            ...state.partnerOrdersHistory,
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
