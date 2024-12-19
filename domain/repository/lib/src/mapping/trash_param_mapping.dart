import 'package:model/model.dart';
import 'package:network/network.dart';

extension TrashParamMapping on TrashDto {


  TrashParamModel toModel(){
    return TrashParamModel(key: key, price: price);
  }

}