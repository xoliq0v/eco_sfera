import 'package:model/model.dart';
import 'package:network/network.dart';

extension HistoryMapper on HistoryDto{

  HistoryModel toModel(){
    return HistoryModel(id: id??-1, date: date??'NULL', user: User(id: user?.id??-1, name: user?.name, phoneNumber: user?.phoneNumber), location: OrderLocationModel(latitude: location?.latitude??'', longitude: location?.longitude??'NULL', id: location?.id??-1), paperKg: paperKg??'NULL', paperPrice: paperPrice??'NULL', plasticKg: plasticKg??'NULL', plasticPrice: plasticPrice??'NULL', plasticBottleKg: plasticBottleKg??'NULL', plasticBottlePrice: plasticBottlePrice??'NULL', cartonKg: cartonKg??'NULL', cartonPrice: cartonPrice??'NULL', totalKg: totalKg??'NULL', totalPrice: totalPrice??'NULL', type: type??'NULL');
  }

}