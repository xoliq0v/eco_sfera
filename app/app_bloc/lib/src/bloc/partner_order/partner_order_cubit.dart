import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';
import '../mixin/pagination.dart';

part 'partner_order_state.dart';

class PartnerOrderCubit extends Cubit<PartnerOrderState>
    with PaginationCubitWrapper {
  PartnerOrderCubit(
        this._getType,
        this._fethchPartnerOrders, {
        required int initialPageSize,
    }) : super(const PartnerOrderState()){
    localInitialPageSize = initialPageSize;
    fetchPartnerOrders();
  }

  final GetPartnerOrdersUseCase _fethchPartnerOrders;
  final GetAuthType _getType;

  Future<bool?> fetchPartnerOrders() async {
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return null;
    }
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    if (!isLoaded) emit(state.copyWith(isLoadingShimmer: true));
    if (isLoaded && state.partnerOrders.isNotEmpty) {
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
      '',
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
            ...state.partnerOrders,
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
