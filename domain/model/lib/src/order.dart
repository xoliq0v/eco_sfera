import 'package:equatable/equatable.dart';
import 'package:model/src/order_location.dart';

class OrderModel extends Equatable {
  final bool isSent;
  final int totalKg;
  final String totalPrice;
  final DateTime date;
  final int id;
  final int locationId;
  final String userId;
  final List<OrderLocationModel> locations;

  const OrderModel({
    required this.isSent,
    required this.totalKg,
    required this.totalPrice,
    required this.date,
    required this.id,
    required this.locationId,
    required this.userId,
    required this.locations,
  });

  @override
  List<Object?> get props => [isSent, totalKg, totalPrice, date, id, locationId, userId, locations];
}
