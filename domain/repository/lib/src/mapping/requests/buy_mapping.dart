import 'package:model/model.dart';
import 'package:network/network.dart';

extension BuyMapping on BuyModel {

  BuyDto toBuyModel(){
    return BuyDto(
        employee: employee,
        customerId: customerId,
        paperKg: paperKg,
        paperPrice: paperPrice,
        plasticKg: plasticKg,
        plasticPrice: plasticPrice,
        plasticBottleKg: plasticBottleKg,
        plasticBottlePrice: plasticBottlePrice,
        cartonKg: cartonKg,
        cartonPrice: cartonPrice,
        totalKg: totalKg,
        totalPrice: totalPrice,
        type: type
    );
  }

}