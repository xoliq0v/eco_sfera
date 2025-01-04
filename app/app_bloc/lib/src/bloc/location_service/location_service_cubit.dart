import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

part 'location_service_cubit.freezed.dart';
part 'location_service_state.dart';

class LocationServiceCubit extends Cubit<LocationServiceState>{

  LocationServiceCubit(
      this._getLocation
      ):super(LocationServiceState.init());

  final GetLocation _getLocation;

  Future<void> getLocation()async{

    emit(LocationServiceState.loading());

    try{

      final result = await _getLocation.get();

      emit(LocationServiceState.success(result));

    }catch(e){

      emit(LocationServiceState.error(e));

    }

  }

  Future<void> init() async{
    emit(LocationServiceState.init());
  }
}