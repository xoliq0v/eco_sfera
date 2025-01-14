import 'package:model/model.dart';
import 'package:network/network.dart';

extension HistoryMapper on HistoryDto{

  HistoryModel toModel(){
    return HistoryModel(id: id, date: date, user: User(id: user.id, name: user.name, phoneNumber: user.phoneNumber), location: OrderLocationModel(latitude: location.latitude, longitude: location.longitude, id: location.id), paperKg: paperKg, paperPrice: paperPrice, plasticKg: plasticKg, plasticPrice: plasticPrice, plasticBottleKg: plasticBottleKg, plasticBottlePrice: plasticBottlePrice, cartonKg: cartonKg, cartonPrice: cartonPrice, totalKg: totalKg, totalPrice: totalPrice, type: type);
  }

}