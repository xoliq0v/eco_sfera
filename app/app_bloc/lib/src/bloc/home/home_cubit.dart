import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'home_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit(
      this._openAppSettings,
      ) : super(const HomeControllerState());

  final OpenAppSettings _openAppSettings;

  void showLocationSetting({required bool showLocationSetting}) {
    emit(state.copyWith(showLocationSetting: showLocationSetting));
  }

  void openLocationSetting() {
    _openAppSettings.location();
  }
}
