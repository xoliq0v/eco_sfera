import 'package:core/core.dart';

class PartnerOrder extends Equatable {
  final int id;
  final DriverModel driver;
  final String? phone;
  final String? comment;
  final String? totalPrice;
  final String? longitude;
  final String? latitude;
  final List<ProductItem>? products;
  final String? status;
  final String? date;
  final double? distance;

  const PartnerOrder({
    required this.id,
    required this.driver,
    required this.phone,
    required this.comment,
    required this.totalPrice,
    required this.longitude,
    required this.latitude,
    required this.status,
    required this.date,
    required this.distance,
    required this.products
  });

  PartnerOrder copyWith({
    double? distance,
  }) {
    return PartnerOrder(
      id: id,
      driver: driver,
      phone: phone,
      comment: comment,
      totalPrice: totalPrice,
      longitude: longitude,
      latitude: latitude,
      status: status,
      date: date,
      distance: distance,
      products: products
    );
  }

  @override
  List<Object?> get props => [id, driver, phone, comment, totalPrice, longitude, latitude, status, date, distance,products];
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
class ProductItem extends Equatable {
  final String productUz;
  final String? productEn;
  final String productRu;
  final String productWeight;

  const ProductItem({
    required this.productUz,
    this.productEn,
    required this.productRu,
    required this.productWeight,
  });

  @override
  List<Object?> get props => [productUz, productEn, productRu, productWeight];

  @override
  bool get stringify => true;
}