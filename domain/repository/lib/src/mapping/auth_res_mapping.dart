import 'package:model/model.dart';
import 'package:network/network.dart';

extension AuthResMapping on AuthResDTO {
  AuthResult toModel() {
    return AuthResult(
      token: token,
      type: type == 'driver' ? AuthType.driver : AuthType.partner,
    );
  }
}