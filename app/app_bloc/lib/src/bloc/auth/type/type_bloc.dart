import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../../app_bloc.dart';

part 'type_state.dart';

class TypeBloc extends Cubit<AuthTypeState>{
  TypeBloc(
      this._getAuthType
      ):super(Init()){
        get();
      }

  final GetAuthType _getAuthType;

  Future<void> get() async{
    try{
      final res = await _getAuthType.get();
        print(res);
        if(res == AuthType.partner){
          emit(PartnerType());
        }else{
          emit(DriverType());
        }
    }catch(e){
      emit(Fail(e.toString()));
    }
  }

}