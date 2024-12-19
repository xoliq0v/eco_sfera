import 'package:model/model.dart';
import 'package:network/network.dart';
import 'package:repository/src/mapping/distance_mapper.dart';
import 'package:repository/src/mapping/order_location_mapping.dart';

extension OrderModelExt on OrderDto {

  OrderModel toOrderModel(){
    return OrderModel(
        totalKg: totalKg,
        totalPrice: totalPrice,
        date: date,
        id: id,
        orderUser: OrderUser(id: user.id, name: user.name, phoneNumber: user.phoneNumber),
        locations: locations.map((data){
          return data.toOrderLocationModel();
        }).toList(),
    );
  }

}