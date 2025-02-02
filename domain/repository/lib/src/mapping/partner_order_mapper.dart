import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:model/model.dart';
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
      status: status, 
      date: date,
      distance: 1,
      products: products?.map((item)=> item.toDTO()).toList()
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

extension ProductItemMapper on PartnerOrderDtoItem{

  ProductItem toDTO(){
    return ProductItem(
      productRu: productRu,
      productUz: productUz,
      productWeight: productWeight,
      productEn: productEn
    );
  }
}