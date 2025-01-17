import 'package:model/model.dart';
import 'package:network/network.dart';

extension OrderLocationMappingExt on LocationDto {

  OrderLocationModel toOrderLocationModel(){
    return OrderLocationModel(
        latitude: latitude??"NULL",
        longitude: longitude??'NULL',
        id: id ?? -1
    );
  }

}