abstract class SecureStorage {
  Future<void> saveToken(String value);

  Future<String?> getToken();

  Future<void> closeSession();
}
