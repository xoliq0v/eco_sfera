
import 'package:model/model.dart';
import 'package:network/network.dart';

extension CustomerRequestExt on CustomerGetModel {
  CustomerGetRequestDTO toCustomerGetRequestDTO(){
    return CustomerGetRequestDTO(size: size, page: page);
  }
}