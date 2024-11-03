abstract class AppStorage {
  Future<bool> savePhoneNumber(String value);

  String? getPhoneNumber();

  Future<bool> closeSession();
}
