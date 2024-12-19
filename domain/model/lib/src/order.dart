import 'package:equatable/equatable.dart';
import 'package:model/src/order_location.dart';

import 'order_user.dart';

class OrderModel extends Equatable {
  final int totalKg;
  final String totalPrice;
  final DateTime date;
  final int id;
  final OrderUser orderUser;
  final List<OrderLocationModel> locations;
  final double? distance;

  const OrderModel({
    required this.totalKg,
    required this.totalPrice,
    required this.date,
    required this.id,
    required this.orderUser,
    required this.locations,
    this.distance,
  });

  // CopyWith function to create a new OrderModel with optional changes to some properties
  OrderModel copyWith({
    int? totalKg,
    String? totalPrice,
    DateTime? date,
    int? id,
    OrderUser? orderUser,
    List<OrderLocationModel>? locations,
    double? distance,
  }) {
    return OrderModel(
      totalKg: totalKg ?? this.totalKg,
      totalPrice: totalPrice ?? this.totalPrice,
      date: date ?? this.date,
      id: id ?? this.id,
      orderUser: orderUser ?? this.orderUser,
      locations: locations ?? this.locations,
      distance: distance ?? this.distance,
    );
  }

  @override
  List<Object?> get props => [totalKg, totalPrice, date, id, orderUser, locations, distance];
}
