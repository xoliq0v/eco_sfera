import 'package:core/core.dart';
import 'package:firebase_eco/firebase_eco.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';
import '../mixin/pagination.dart';

part 'partner_order_state.dart';

class PartnerOrderCubit extends Cubit<PartnerOrderState>
    with PaginationCubitWrapper {
  PartnerOrderCubit(
        this._changePartnerStatus,
        this._getType,
        this._fethchPartnerOrders, {
        required int initialPageSize,
    }) : super(const PartnerOrderState()){
    localInitialPageSize = initialPageSize;
    fetchPartnerOrders();
    _listenToBotChanges();
  }

  final GetPartnerOrdersUseCase _fethchPartnerOrders;
  final GetAuthType _getType;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final ChangePartnerStatusUseCase _changePartnerStatus;

  Future<bool> accept(int id) async{
    await _changePartnerStatus.call(true);
    _fetchWithoutLoading();
    return true;
  }

  void _listenToBotChanges() async{
    final type = await _getType.get();
    if(type.runtimeType == DriverType){
      return;
    }
    _firebaseDatabase.ref('bot').onValue.listen((event) {
      final botValue = event.snapshot.value;
      print('[log] Bot value changed: $botValue');
      if(botValue != null){
        _fetchWithoutLoading();
      }
    });
  }

  void _fetchWithoutLoading(){
    localCurrentPage = 0;
    _fetch();
  }

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
