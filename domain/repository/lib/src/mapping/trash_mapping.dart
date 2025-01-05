import 'package:model/model.dart';
import 'package:network/network.dart';

extension TrashMapping on TrashInfoDto {
  TrashInfo toModel(){
    return TrashInfo(id: id, name: name, nameRu: nameRu, nameKr: nameKr, key: key, price: double.parse(price??'0'));
  }
}