import 'package:database/database.dart';
import 'package:network/network.dart';
import 'package:model/model.dart';

extension ClientInfoDTOExt on DriverDTO {
  DriverEntity toUserProfileEntity() {
    return DriverEntity(earnings: int.parse(earnings.toString()) ?? 0, outlay: int.parse(outlay.toString()) ?? 0, profileImage: profileImage??'NULL', name: name ?? 'NULL', surname: surname ?? 'NULL', phone: phone?? 'NULL', login: login?? 'NULL', password: password?? 'NULL', walletId: walletId?? -1, walletBalance: walletBalance ?? 'NULL', workOrder: workOrder ?? 'NULL', vehicle: vehicle ?? 'NULL', vehicleNumber: vehicleNumber?? 'NULL', createdAt: createdAt ?? DateTime.now()
        , updatedAt: updatedAt ?? DateTime.now(), patronymic: patronymic ?? 'NULL', nickname: nickname?? 'NULL', province: province?? 'NULL', district: district?? 'NULL', address: address?? 'NULL', isActive: isActive?? false, status: status?? false);
  }
}


extension UserProfileEntityExt on DriverEntity {
  DriverData toUserProfile() {
    return DriverData(outlay: outlay.toString(), earnings: earnings.toString(), id: id,profileImage: profileImage, name: name, surname: surname, phone: phone, login: login, password: password, walletId: walletId, walletBalance: walletBalance, workOrder: workOrder, vehicle: vehicle, vehicleNumber: vehicleNumber, createdAt: createdAt, updatedAt: updatedAt, patronymic: patronymic, nickname: nickname, province: province, district: district, address: address, isActive: isActive, status: status);
  }
}