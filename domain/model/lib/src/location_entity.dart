import 'package:core/core.dart';

class LocationEntity extends Equatable {
  final double latitude;
  final double longitude;

  LocationEntity({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude,longitude];
}