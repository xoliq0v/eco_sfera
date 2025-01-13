import 'package:model/model.dart';
import 'package:network/network.dart';

extension CustomerDTOExt on CustomerDto {
  Customer toCustomerModel(){
    return Customer(
        id: id,
        name: name,
        // surname: surname,
    );
  }
}

extension CustomerExt on CustomerPostModel {
  CustomerPostDTO toCustomerPostDTO(){
    return CustomerPostDTO(fullName: fullName, phone: phone, regionId: regionId, address: address);
  }
}