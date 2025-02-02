import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'user_data_state.dart';
part 'user_data_cubit.freezed.dart';

class UserDataCubit extends Cubit<UserDataState>{
  UserDataCubit(
    this._getUserProfile,
    this._getPartnerProfile,
    this._authType
  ):super(UserDataState.init()){
    init();
  }

  final GetUserProfile _getUserProfile;
  final GetPartnerProfile _getPartnerProfile;
  final GetAuthType _authType;

  Future<void> init()async{
    emit(UserDataState.loading());
    final type = await _authType.get();
    if(type == AuthType.driver){
      final driver = _getUserProfile.get();
      emit(UserDataState.success(driver: driver));
      return;
    }else{
      final partner = _getPartnerProfile.get();
      emit(UserDataState.success(partner: partner));
      return;
    }
  }

  Future<PartnerInfoModel?> getPartner()async{
    return await _getPartnerProfile.get();
  } 

  Future<DriverData?> getDriver()async{
    return await _getUserProfile.get();
  } 

}