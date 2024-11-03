import 'package:core/src/env/env.dart';
import 'package:envied/envied.dart';

part 'base_env.g.dart';

@Envied(path: '.env')
class BaseEnv implements Env {
  @EnviedField(varName: 'BASE_URL')
  static const String _baseUrl = _BaseEnv._baseUrl;

  @EnviedField(varName: 'MAP_API_KEY')
  static const String _mapApiKey = _BaseEnv._mapApiKey;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get mapApiKey => _mapApiKey;
}
