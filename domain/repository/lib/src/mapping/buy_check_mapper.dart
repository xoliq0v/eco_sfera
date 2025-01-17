import 'package:model/model.dart';
import 'package:network/network.dart';

extension BuyCheckMapper on BuyCheckDto {

  BuyCheckModel toModel(){

    return BuyCheckModel(
        employeeId: employeeId??-1,
        userId: userId?? -1,
        amount: amount??-1,
        payerName: payerName??'null',
        organizationPhoneNumber: organizationPhoneNumber??'NULL',
        organizationName: organizationName??'NULL',
        organizationAddress: organizationAddress??'NULL',
        branchName: branchName??'NULL',
        checkNumber: checkNumber??'NULL',
        stir: stir??'NULL',
        updatedAt: updatedAt??DateTime.now()
        , id: id??-1,
        date: date ??'NULL'
    );

  }

}