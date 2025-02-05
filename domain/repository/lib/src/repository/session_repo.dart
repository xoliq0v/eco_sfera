import 'package:model/model.dart';

abstract class SessionRepository {
  Future<void> saveToken(String value);

  Future<String?> getToken();

  Future<void> closeSession();

  Future<void> saveType(AuthType value);

  AuthType getType();
}
