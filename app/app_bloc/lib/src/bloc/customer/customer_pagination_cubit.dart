import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:use_case/use_case.dart';

import '../mixin/pagination.dart';

part 'customer_pagination_state.dart';

class CustomerPaginationCubit extends Cubit<CustomerPaginationState>
    with PaginationCubitWrapper {
  CustomerPaginationCubit(
      this._getCustomer, {
        required int initialPageSize,
      }) : super(const CustomerPaginationState()) {
    localInitialPageSize = initialPageSize;
    getCustomer();
  }

  final GetCustomer _getCustomer;

  Future<bool?> getCustomer() async {
    if (isLastPage || state.isLoadingPagination || state.isLoadingShimmer) {
      return null;
    }
    if (!isLoaded) emit(state.copyWith(isLoadingShimmer: true));
    if (isLoaded && state.customers.isNotEmpty) {
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
    final res = await _getCustomer.get(
      page: localCurrentPage,
      size: localPageSize,
    );
    switch (res.status) {
      case Status.completed:
        final customers = res.data?.content ?? [];
        isLastPage = customers.length < localPageSize;
        isLoaded = true;
        if (res.data?.pagination.total != null) {
          isLastPage = res.data!.pagination.total - 1 == localCurrentPage;
        }
        if (!isLastPage) localCurrentPage += 1;
        if (isRefresh) {
          emit(state.copyWith(customers: customers));
        } else {
          emit(state.copyWith(customers: [
            ...state.customers,
            ...customers,
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
