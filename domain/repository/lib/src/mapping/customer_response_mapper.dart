import 'package:model/model.dart';
import 'package:network/network.dart';

extension CustomerResponseMapper on CustomerResponseDto {

  CustomerResponseModel toModel(){

    return CustomerResponseModel(name: name, surname: surname, gender: gender, phone: phone, birthDate: birthDate, address: address, updatedAt: updatedAt, createdAt: createdAt, id: id);

  }

}