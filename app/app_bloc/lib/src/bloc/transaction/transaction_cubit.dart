import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'transaction_cubit.freezed.dart';
part  'transaction_state.dart';


class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit(
      this._getTransactions,
      this._getUserProfile
      ): super(TransactionState.init()){
    fetchTransaction();
  }

  final GetTransactions _getTransactions;
  final GetUserProfile _getUserProfile;

  Future<void> fetchTransaction()async{
    emit(TransactionState.loading());

    final res = await _getTransactions.get();
    final userRes = await _getUserProfile.get();

    if(res.status == Status.completed){

      emit(TransactionState.success(res.data!,userRes!));

    }else{

      emit(TransactionState.error(res.error!.message));

    }

  }

}