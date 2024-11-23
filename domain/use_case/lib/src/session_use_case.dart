abstract class GetToken {
  Future<String?> get();
}

abstract class SaveToken{
  Future<void> save(String value);
}
