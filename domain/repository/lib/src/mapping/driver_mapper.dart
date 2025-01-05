import 'package:database/database.dart';
import 'package:network/network.dart';
import 'package:model/model.dart';

extension ClientInfoDTOExt on DriverDTO {
  DriverEntity toUserProfileEntity() {
    return DriverEntity(name: name, surname: surname, phone: phone, login: login, password: password, walletId: walletId, walletBalance: walletBalance, workOrder: workOrder, vehicle: vehicle, vehicleNumber: vehicleNumber, createdAt: createdAt, updatedAt: updatedAt, patronymic: patronymic, nickname: nickname, province: province, district: district, address: address, isActive: isActive, status: status);
  }
}


extension UserProfileEntityExt on DriverEntity {
  DriverData toUserProfile() {
    return DriverData(id: id, name: name, surname: surname, phone: phone, login: login, password: password, walletId: walletId, walletBalance: walletBalance, workOrder: workOrder, vehicle: vehicle, vehicleNumber: vehicleNumber, createdAt: createdAt, updatedAt: updatedAt, patronymic: patronymic, nickname: nickname, province: province, district: district, address: address, isActive: isActive, status: status);
  }
}