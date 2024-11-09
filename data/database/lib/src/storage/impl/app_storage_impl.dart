import 'package:database/database.dart';
import 'package:database/src/endpoints/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorageImpl implements AppStorage {
  AppStorageImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  String? getPhoneNumber() {
    return sharedPreferences.getString(StorageEndpoints.phoneNumber);
  }

  @override
  Future<bool> savePhoneNumber(String value) {
    return sharedPreferences.setString(StorageEndpoints.phoneNumber, value);
  }

  @override
  Future<bool> closeSession() {
    return sharedPreferences.clear();
  }
}
