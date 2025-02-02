
import '../../../app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

part 'buy_cubit.freezed.dart';
part 'buy_state.dart';

class BuyCubit extends Cubit<BuyState>{

  BuyCubit(
      this._buy,
      this.search,
      this._fetchBuyPageParams,
      this.getUserProfile,
      this._fetchBalance,
      this._getBalance
      ):super(BuyState.init()){
    fetchParams();
  }

  final Buy _buy;
  final SearchCustomer search;
  final FetchBuyPageParams _fetchBuyPageParams;
  final GetUserProfile getUserProfile;
  final FetchBalance _fetchBalance;
  final GetBalance _getBalance;

  Future<void> fetchParams() async {
    emit(BuyState.loading());

    try {
      final result = await _fetchBuyPageParams.fetch();
      final user = await getUserProfile.get();

      if (result.data != null) {
        if(user != null) emit(BuyState.success(result.data!,user));
      } else {
        emit(BuyState.error('Failed to fetch buy page parameters!'));
      }
    } catch (e) {
      emit(BuyState.error('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> buy(BuyReq model) async {

    emit(BuyState.buyLoading());

    await _fetchBalance.fetch();

    final balance = await _getBalance.get();
    print('BALANCE: ${balance?.toDouble()??0}');
    if((balance?.toDouble()??0) < model.totalPrice){
      emit(BuyState.notEnoughBalance());
      return;
    }

    try {
      final result = await _buy.buy(model);

      if (result.status == Status.completed) {
        emit(BuyState.buySuccess(result.data!));
      } else {
        emit(BuyState.error('Failed to post data!'));
      }
    } catch (e) {
      emit(BuyState.error('An unexpected error occurred: ${e.toString()}'));
    }

  }


  Future<void> searchCustomer(String number) async {

    emit(BuyState.searchLoading());

    final result = await search.search(number);

    if(result.status == Status.completed){

      emit(BuyState.searchResult(result.data??[]));

    }

  }

}