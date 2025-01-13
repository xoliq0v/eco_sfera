import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'get_region_cubit.freezed.dart';
part 'region_state.dart';

class RegionCubit extends Cubit<RegionState>{
  RegionCubit(
    this._getRegions,
  ): super(RegionState.init()) {
    fetch();
  }

  final GetRegions _getRegions;

  Future<void> fetch() async{

    emit(RegionState.loading());

    final res = await _getRegions.get();

    if(res.data != null){

      emit(RegionState.success(res.data!));

    }else{

      emit(RegionState.error(res.error?.message??'Update app'));

    }

  }


}