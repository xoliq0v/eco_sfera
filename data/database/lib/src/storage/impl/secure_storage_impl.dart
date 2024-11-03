import 'package:database/database.dart';
import 'package:database/src/endpoints/endpoints.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  SecureStorageImpl({required this.flutterSecureStorage});

  final FlutterSecureStorage flutterSecureStorage;

  @override
  Future<String?> getPassword() {
    return flutterSecureStorage.read(key: StorageEndpoints.password);
  }

  @override
  Future<void> savePassword(String value) {
    return flutterSecureStorage.write(
      key: StorageEndpoints.password,
      value: value,
    );
  }

  @override
  Future<void> closeSession() => flutterSecureStorage.deleteAll();
}
