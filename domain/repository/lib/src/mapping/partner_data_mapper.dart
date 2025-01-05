import 'package:database/database.dart';
import 'package:model/model.dart';
import 'package:network/network.dart';

extension PartnerDataMapper on PartnerInfoDto {
  PartnerEntity toEntity(){
    return PartnerEntity(id: id, latitude: latitude, longitude: longitude, createdAt: createdAt, updatedAt: updatedAt, province: province, district: district, address: address, isActive: isActive, status: status, nickname: nickname, fish: fish, comment: comment, login: login, password: password, trashes: trashes, trashePrices: trashePrices);
  }
}

extension PartnerEntityMapper on PartnerEntity {
  PartnerInfoModel toUserProfile(){
    return PartnerInfoModel(id: id, latitude: latitude, longitude: longitude, location: location, createdAt: createdAt, updatedAt: updatedAt, province: province, district: district, address: address, isActive: isActive, status: status, nickname: nickname, fish: fish, comment: comment, login: login, password: password, trashes: trashes, trashePrices: trashePrices, phone: phone);
  }
}