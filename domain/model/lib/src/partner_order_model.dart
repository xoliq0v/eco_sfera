import 'package:core/core.dart';

class PartnerOrder extends Equatable {
  final int id;
  final DriverModel driver;
  final String? phone;
  final String? comment;
  final String? totalPrice;
  final String? longitude;
  final String? latitude;
  final String? productType;
  final String? productWeight;
  final String? status;
  final String? date;

  const PartnerOrder({
    required this.id,
    required this.driver,
    required this.phone,
    required this.comment,
    required this.totalPrice,
    required this.longitude,
    required this.latitude,
    required this.productType,
    required this.productWeight,
    required this.status,
    required this.date,
  });

  @override
  List<Object?> get props => [id, driver, phone, comment, totalPrice, longitude, latitude, productType, productWeight, status, date];
}
class DriverModel extends Equatable {
  final int id;
  final String? name;
  final String? phoneNumber;

  const DriverModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [id, name, phoneNumber];
}