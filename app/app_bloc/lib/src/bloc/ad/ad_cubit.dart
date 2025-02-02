import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'ad_state.dart';
part 'ad_cubit.freezed.dart';

class AdCubit extends Cubit<AdState> {
  AdCubit(
    this._postAddUseCase
  ):super(AdState.init());

  final PostAddUseCase _postAddUseCase;

  Future<void> post(Announcement m) async{
    emit(AdState.loading());

    final result = await _postAddUseCase.post(m);

    if(result.data??false){
      emit(AdState.success());
    }else{
      emit(AdState.error());
    }

  }

}