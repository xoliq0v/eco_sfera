import 'package:equatable/equatable.dart';

import '../model.dart';

class HistoryModel extends Equatable {
  final int id;
  final String date;
  final User user;
  final OrderLocationModel location;
  final int paperKg;
  final String paperPrice;
  final int plasticKg;
  final String plasticPrice;
  final int plasticBottleKg;
  final String plasticBottlePrice;
  final int cartonKg;
  final String cartonPrice;
  final int totalKg;
  final String totalPrice;
  final String type;

  const HistoryModel({
    required this.id,
    required this.date,
    required this.user,
    required this.location,
    required this.paperKg,
    required this.paperPrice,
    required this.plasticKg,
    required this.plasticPrice,
    required this.plasticBottleKg,
    required this.plasticBottlePrice,
    required this.cartonKg,
    required this.cartonPrice,
    required this.totalKg,
    required this.totalPrice,
    required this.type,
  });

  @override
  List<Object> get props => [
    id,
    date,
    user,
    location,
    paperKg,
    paperPrice,
    plasticKg,
    plasticPrice,
    plasticBottleKg,
    plasticBottlePrice,
    cartonKg,
    cartonPrice,
    totalKg,
    totalPrice,
    type,
  ];
}
