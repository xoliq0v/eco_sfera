import 'package:model/model.dart';
import 'package:network/network.dart';
import 'package:repository/src/mapping/order_location_mapping.dart';

extension OrderModelExt on OrderDto {

  OrderModel toOrderModel(){
    return OrderModel(
        isSent: isSent,
        totalKg: totalKg,
        totalPrice: totalPrice,
        date: date,
        id: id,
        locationId: locationId,
        userId: userId,
        locations: locations.map((data){
          return data.toOrderLocationModel();
        }).toList(),
    );
  }

}