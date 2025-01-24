import 'package:model/model.dart';
import 'package:network/network.dart';

extension PartnerEditMapping on PartnerEdit {
  PartnerEditDto toDto() {
    return PartnerEditDto(nickname: nickname, phone: phone, comment: comment);
  }
}