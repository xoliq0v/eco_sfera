import 'package:model/model.dart';
import 'package:network/network.dart';

extension PartnerDataMapping on PartnerDataDto {
  PartnerData toModel() {
    return PartnerData(
      id: id??0,
      comment: comment??'',
      nickname: nickname??'',
      longitude: longitude??'',
      latitude: latitude??'',
    );
  }
}