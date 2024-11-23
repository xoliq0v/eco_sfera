import 'package:database/database.dart';
import 'package:database/src/endpoints/endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  SecureStorageImpl({required this.flutterSecureStorage});

  final FlutterSecureStorage flutterSecureStorage;

  @override
  Future<String?> getToken() {
    return flutterSecureStorage.read(key: StorageEndpoints.token);
  }

  @override
  Future<void> saveToken(String value) {
    return flutterSecureStorage.write(
      key: StorageEndpoints.token,
      value: value,
    );
  }

  @override
  Future<void> closeSession() => flutterSecureStorage.deleteAll();
}
