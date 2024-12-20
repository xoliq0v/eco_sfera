import 'package:use_case/src/session_use_case.dart';
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
