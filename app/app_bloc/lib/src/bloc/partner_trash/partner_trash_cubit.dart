import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'partner_trash_cubit.freezed.dart';
part 'partner_trash_state.dart';

class PartnerTrashCubit extends Cubit<PartnerTrashState> {
  PartnerTrashCubit(this._getPartnerTrash, this._changeTrashPrice) : super(const PartnerTrashState.initial());


  final PartnerGetTrashUseCase _getPartnerTrash;
  final ChangeTrashPriceUseCase _changeTrashPrice;

  Future<void> fetch() async{
    emit(const PartnerTrashState.loading());
    final result = await _getPartnerTrash.call();
    if(result.data != null){
      emit(PartnerTrashState.success(partners: result.data));
    }else{
      emit(PartnerTrashState.error(result.error?.message ?? ''));
    }
  }

  Future<bool> changeTrashPrice(int id, String price) async{
    final result = await _changeTrashPrice.call(id, price);
    if(result.data != null){
      return true;
    }else{
      return false;
    }
  }

}