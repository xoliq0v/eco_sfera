import 'package:core/core.dart';

class Route extends Equatable {
  const Route({
    required this.id,
    required this.name,
    required this.number,
    required this.latitude,
    required this.longitude,
  });

  final int id;
  final String name;
  final String number;
  final String latitude;
  final String longitude;

  @override
  List<Object?> get props => [id,name,number,latitude,longitude];



}