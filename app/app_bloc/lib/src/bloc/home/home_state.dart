part of 'home_cubit.dart';

class HomeControllerState extends Equatable {
  const HomeControllerState({
    this.showLocationSetting = false,
  });

  final bool showLocationSetting;

  HomeControllerState copyWith({
    bool? showLocationSetting,
  }) {
    return HomeControllerState(
      showLocationSetting: showLocationSetting ?? this.showLocationSetting,
    );
  }

  @override
  List<Object?> get props => [showLocationSetting];
}
