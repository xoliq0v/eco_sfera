abstract class AppStorage {
  Future<bool> savePhoneNumber(String value);

  String? getPhoneNumber();

  Future<bool> closeSession();

  Future<bool> saveType(String value);

  String? getType();
}
