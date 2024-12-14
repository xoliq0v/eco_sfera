import 'package:model/model.dart';
import 'package:network/network.dart';

extension AuthModelExt on AuthModel {

  AuthDTO toAuthDto(){
    return AuthDTO(
        login: login,
        password: password,
        deviceToken: deviceToken
    );
  }

}