import 'package:model/model.dart';
import 'package:network/network.dart';

extension ActiveHistoryMapper on ActiveHistoryDto{

  ActiveHistory toModel(){
    return ActiveHistory(
        id: id??-1,
        user: User(id: user?.id??-1, name: user?.name, phoneNumber: user?.phoneNumber),
        locations: locations?.map((item)=> OrderLocationModel(latitude: item.latitude??'NULL', longitude: item.longitude??'NULL', id: item.id??-1)).toList() ?? [],
        items: items?.map((item)=> Item(name: item.name, price: item.price, kg: item.kg??-1)).toList()??[],
        status: status,
        totalPrice: totalPrice,
        totalKg: totalKg??-1,
        date: date
    );
  }
}