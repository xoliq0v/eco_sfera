import 'package:equatable/equatable.dart';

class BuyModel extends Equatable {
  final String employee;
  final int customerId;
  final double paperKg;
  final double paperPrice;
  final double plasticKg;
  final double plasticPrice;
  final double plasticBottleKg;
  final double plasticBottlePrice;
  final double cartonKg;
  final double cartonPrice;
  final double totalKg;
  final double totalPrice;
  final String type;

  const BuyModel({
    required this.employee,
    required this.customerId,
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
  List<Object?> get props => [
    employee,
    customerId,
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
