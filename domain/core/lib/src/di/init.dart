
import 'dart:async';

import 'package:core/core.dart';

@module
abstract class CoreModule{

  @singleton
  Env provideDevEnv() {
    return BaseEnv();
  }

  @lazySingleton
  @Named('base_url')
  String provideBaseUrl(Env env) {
    return env.baseUrl;
  }

  @lazySingleton
  @Named('map_api_key')
  String provideMapApiKey(Env env) {
    return env.mapApiKey;
  }

  @lazySingleton
  Connectivity provideConnectivity() {
    return Connectivity();
  }

  @lazySingleton
  InternetConnectionChecker provideInternetConnectionChecker(
      @Named('base_url') String baseUrl,
      ) {
    final url = Uri.parse(baseUrl);
    return InternetConnectionChecker.createInstance(
      checkTimeout: const Duration(seconds: 3),
      addresses: [
        AddressCheckOptions(hostname: url.host, port: url.port),
      ],
    );
  }

}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}