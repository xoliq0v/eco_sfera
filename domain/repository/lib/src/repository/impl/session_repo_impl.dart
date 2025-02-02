import 'package:database/database.dart';
import 'package:model/src/auth_result.dart';
import '../../../repository.dart';

class SessionRepositoryImpl extends SessionRepository {
  SessionRepositoryImpl({
    required this.appDatabase,
    required this.appStorage,
    required this.secureStorage
  });

  final AppStorage appStorage;
  final SecureStorage secureStorage;
  final MyObjectBox appDatabase;


  @override
  Future<void> closeSession() {
    return Future.wait([
      secureStorage.closeSession(),
      appStorage.closeSession(),
      appDatabase.closeSessions(),
    ]);
  }

  @override
  Future<String?> getToken() {
    return secureStorage.getToken();
  }

  @override
  Future<void> saveToken(String value) {
    return secureStorage.saveToken(value);
  }

  @override
  Future<void> saveType(AuthType value) {
    return appStorage.saveType(value == AuthType.driver ? 'driver' : 'partner');
  }

  @override
  AuthType getType() {
    return appStorage.getType() == 'driver' ? AuthType.driver : AuthType.partner;
  }

}