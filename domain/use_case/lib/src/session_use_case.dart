import 'package:model/model.dart';

abstract class GetToken {
  Future<String?> get();
}

abstract class SaveToken{
  Future<void> save(String value);
}

abstract class SaveType {
  Future<void> save(AuthType value);
  Future<AuthType> get();
}