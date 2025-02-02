import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'edit_partner_info_state.dart';
part 'edit_partner_info_cubit.freezed.dart';

class EditPartnerInfoCubit extends Cubit<EditPartnerInfoState> {
  EditPartnerInfoCubit(this._editPartnerInfo,this._getPartnerProfile) : super(const EditPartnerInfoState.initial());

  final PartnerEditUseCase _editPartnerInfo;
  final GetPartnerProfile _getPartnerProfile;

  Future<bool> editPartnerInfo(PartnerEdit partnerEdit) async{
    emit(const EditPartnerInfoState.loading());
    final result = await _editPartnerInfo.call(partnerEdit);
    if(result.data != null){
      emit(const EditPartnerInfoState.success());
      return true;
    }else{
      emit(const EditPartnerInfoState.error(LocaleKeys.tryAgain));
      return false;
    }
  }

  Future<PartnerInfoModel?> getPartnerProfile() async{
    emit(const EditPartnerInfoState.loading());
    final result = await _getPartnerProfile.get();
    if(result != null){
      return result;
    }else{
      return null;
    }
  }
}
