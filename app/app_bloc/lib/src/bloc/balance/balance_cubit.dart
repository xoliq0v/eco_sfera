import 'dart:async';
import 'dart:developer';

import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'balance_state.dart';
part 'balance_cubit.freezed.dart';

class BalanceCubit extends Cubit<BalanceState>{

  BalanceCubit(
      this._getBalance,
      this._fetchBalance,
      this._getUserProfile,
      ):super(BalanceState.init()){
    log('EVENT: 123');
    _balanceSubscription = _getBalance.watch().listen((event) {
      log('EVENT: $event');
      if(event == null) return;
      init();
    });
  }

  late StreamSubscription<double?> _balanceSubscription;

  final FetchBalance _fetchBalance;
  final GetBalance _getBalance;
  final GetUserProfile _getUserProfile;

  Future<void> refresh() async{
    emit(const BalanceState.loading());
    final res = await _fetchBalance.fetch();
    final userData = await _getUserProfile.get();
    if(res != null){
      emit(BalanceState.success(res.toDouble(),userData!));
    }else{
      emit(BalanceState.error(LocaleKeys.errorGettingTheBalance));
    }
  }

  Future<double?> getBalance() async{
    await refresh();
    return await _getBalance.get();
  }

  Future<void> init()async{
    emit(const BalanceState.loading());
    final res = await _getBalance.get();
    final userData = await _getUserProfile.get();

    log('DATA: $res');

    if (res != null) {
      emit(BalanceState.success(res.toDouble(),userData!));
      return;
    }
    if(res == null){
      final r = await _fetchBalance.fetch();
      if(r==null){
        emit(BalanceState.error(LocaleKeys.errorGettingTheBalance));
      }
    }
    emit(BalanceState.error(LocaleKeys.errorGettingTheBalance));
  }

  @override
  Future<void> close() {
    _balanceSubscription.cancel();
    return super.close();
  }
}