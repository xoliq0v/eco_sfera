import 'package:core/core.dart';

import '../model.dart';

class ActiveHistory extends Equatable {
  final int id;
  final User user;
  final List<OrderLocationModel> locations;
  final List<Item> items;
  final String? status;
  final String? totalPrice;
  final int totalKg;
  final String? date;

  const ActiveHistory({
    required this.id,
    required this.user,
    required this.locations,
    required this.items,
    this.status,
    this.totalPrice,
    required this.totalKg,
    this.date,
  });

  @override
  List<Object?> get props => [id, user, locations, items, status, totalPrice, totalKg, date];
}

class User extends Equatable {
  final int id;
  final String? name;
  final String? phoneNumber;

  const User({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [id, name, phoneNumber];
}

class Item extends Equatable {
  final String? name;
  final String? price;
  final int kg;

  const Item({
    required this.name,
    required this.price,
    required this.kg,
  });

  @override
  List<Object?> get props => [name, price, kg];
}
