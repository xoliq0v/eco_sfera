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
  final List<OrderItemModel>? items;
  final bool status;

  const OrderModel({
    required this.totalKg,
    required this.totalPrice,
    required this.date,
    required this.id,
    required this.orderUser,
    required this.locations,
    required this.items,
    required this.status,
    this.distance,
  });

  OrderModel copyWith({
    int? totalKg,
    String? totalPrice,
    DateTime? date,
    int? id,
    OrderUser? orderUser,
    List<OrderLocationModel>? locations,
    List<OrderItemModel>? items,
    bool? status,
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
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [totalKg, totalPrice, date, id, orderUser, locations, distance, items, status];
}

class OrderItemModel extends Equatable{

  OrderItemModel({
    required this.name,
    required this.price,
    required this.kg,
  });

  String name;
  String price;
  double kg;

  @override
  List<Object?> get props => [name,price, kg];
}