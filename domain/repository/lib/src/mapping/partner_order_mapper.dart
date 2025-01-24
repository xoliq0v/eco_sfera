import 'package:model/model.dart';
import 'package:network/network.dart';

extension PartnerOrderMapper on PartnerOrderDto {
  PartnerOrder toPartnerOrderModel() {
    return PartnerOrder(
      id: id, 
      driver: driver.toDriverModel(),
      phone: phone,
      comment: comment,
      totalPrice: totalPrice,
      longitude: longitude,
      latitude: latitude,
      productType: productType,
      productWeight: productWeight, status: status, date: date,
    );
  }
}

extension DriverMapper on DriverDto {
  DriverModel toDriverModel() {
    return DriverModel(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
    );
  }
}