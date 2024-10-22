import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/utils/service/map_service.dart';
import 'home_state.dart';
import 'map_event.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final MapService _mapService;

  MapBloc(this._mapService) : super(MapInitial()) {
    on<MapCreated>((event, emit) async {
      await _mapService.initializeMap(event.controller);
      emit(MapReady());
    });
  }
}
