import 'package:model/model.dart';
import 'package:network/network.dart';

extension PartnerItemMapping on PartnerDto {

  PartnerItem toModel(){

    return PartnerItem(id: id, comment: comment, nickName: nickname, longitude: longitude, latitude: latitude, phone: phone, status: status, walletId: walletId,walletBalance: walletBalance);

  }

}