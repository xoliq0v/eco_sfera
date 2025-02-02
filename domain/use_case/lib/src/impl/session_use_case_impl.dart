import 'dart:developer';

import 'package:model/model.dart';
import '../session_use_case.dart';
import 'package:repository/repository.dart';

class GetTokenImpl extends GetToken{
  GetTokenImpl({required this.sessionRepository});

  final SessionRepository sessionRepository;

  @override
  Future<String?> get() => sessionRepository.getToken();
}

class SaveTokenImpl extends SaveToken {
  SaveTokenImpl({required this.sessionRepository});

  final SessionRepository sessionRepository;

  @override
  Future<void> save(String value) {
    return sessionRepository.saveToken(value);
  }
}

class SaveTypeImpl extends SaveType {
  SaveTypeImpl({required this.sessionRepository});

  final SessionRepository sessionRepository;

  @override
  Future<void> save(AuthType value) {
    log('SaveTypeImpl: save: $value');
    return sessionRepository.saveType(value);
  }

}

class GetAuthTypeImpl extends GetAuthType {
  GetAuthTypeImpl({required this.sessionRepository});

  final SessionRepository sessionRepository;

  @override
  Future<AuthType> get() async{
    final type = await sessionRepository.getType();
    log('GetAuthTypeImpl get: $type');
    return type;
  }
}
