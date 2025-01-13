import 'package:model/model.dart';
import 'package:network/network.dart';
import 'order_location_mapping.dart';

extension OrderModelExt on OrderDto {

  OrderModel toOrderModel(){
    return OrderModel(
        totalKg: totalKg,
        totalPrice: totalPrice,
        date: date,
        id: id,
        orderUser: OrderUser(id: user.id, name: user.name ?? 'NULL', phoneNumber: user.phoneNumber ?? 'null'),
        items: items.map((item)=> OrderItemModel(name: item.name ?? 'NULL', price: item.price ?? 'NULL',kg: item.kg ?? 0)).toList(),
        status: status == "NEW" ? true : false,
        locations: locations.map((data){
          return data.toOrderLocationModel();
        }).toList(),
    );
  }

}