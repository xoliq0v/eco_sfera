import 'package:model/model.dart';
import 'package:network/network.dart';

extension ActiveHistoryMapper on ActiveHistoryDto{

  ActiveHistory toModel(){
    return ActiveHistory(
        id: id,
        user: User(id: user.id, name: user.name, phoneNumber: user.phoneNumber),
        locations: locations.map((item)=> OrderLocationModel(latitude: item.latitude, longitude: item.longitude, id: item.id)).toList(),
        items: items.map((item)=> Item(name: item.name, price: item.price, kg: item.kg)).toList(),
        status: status,
        totalPrice: totalPrice,
        totalKg: totalKg,
        date: date
    );
  }
}