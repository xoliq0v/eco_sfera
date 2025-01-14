import 'package:model/model.dart';
import 'package:network/network.dart';

extension CustomerResponseMapper on CustomerResponseDto {

  CustomerResponseModel toModel(){

    return CustomerResponseModel(id: id, fullName: fullName, fullAddress: fullAddress, isApproved: isApproved, isVerified: isVerified, isRegistered: isRegistered, regionId: regionId, phoneNumber: phone);

  }

}