import 'package:database/database.dart';
import 'package:network/network.dart';
import 'package:model/model.dart';
import 'package:core/core.dart';

extension ClientInfoDTOExt on ClientDataDTO {
  UserProfileEntity toUserProfileEntity() {
    return UserProfileEntity(
        phone: phone,
        name: name,
        surname: surname,
        id: id,
        walletBalance: wallet_balance,
        walletId: walletId,
        vehicle: vehicle,
        vehicleNumber: wallet_balance,
        workOrder: work_order,
        earnings: earnings,
        outlay: outlay,
        login: login,
    );
  }
}


extension UserProfileEntityExt on UserProfileEntity {
  UserProfile toUserProfile() {
    return UserProfile(
        cId: id,
        name: name,
        surname: surname,
        phone: phone,
        phoneUI: phone?.phoneUI(),
        login: login,
        wallet_id: walletId,
        wallet_balance: walletBalance,
        work_order: workOrder,
        vehicle: vehicle,
        vehicle_number: vehicleNumber,
        earnings: earnings,
        outlay: outlay
    );
  }
}