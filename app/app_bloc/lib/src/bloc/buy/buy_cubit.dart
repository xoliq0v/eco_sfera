
import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

part 'buy_cubit.freezed.dart';
part 'buy_state.dart';

class BuyCubit extends Cubit<BuyState>{

  BuyCubit(
      this._buy,
      this._fetchBuyPageParams
      ):super(BuyState.init()){
    fetchParams();
  }

  final Buy _buy;
  final FetchBuyPageParams _fetchBuyPageParams;

  Future<void> fetchParams() async {
    emit(BuyState.loading());

    try {
      final result = await _fetchBuyPageParams.fetch();

      if (result.data != null) {
        emit(BuyState.success(result.data!));
      } else {
        emit(BuyState.error('Failed to fetch buy page parameters!'));
      }
    } catch (e) {
      emit(BuyState.error('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> buy(BuyReq model) async {

    emit(BuyState.buyLoading());

    try {
      final result = await _buy.buy(model);

      if (result.status == Status.completed) {
        emit(BuyState.buySuccess());
      } else {
        emit(BuyState.error('Failed to post data!'));
      }
    } catch (e) {
      emit(BuyState.error('An unexpected error occurred: ${e.toString()}'));
    }

  }

}