import 'package:core/core.dart';

class OrderLocationModel extends Equatable {
  final String latitude;
  final String longitude;
  final int id;

  const OrderLocationModel({
    required this.latitude,
    required this.longitude,
    required this.id,
  });

  @override
  List<Object?> get props => [latitude, longitude, id];
}