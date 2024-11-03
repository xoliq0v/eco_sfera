abstract class SecureStorage {
  Future<void> savePassword(String value);

  Future<String?> getPassword();

  Future<void> closeSession();
}
