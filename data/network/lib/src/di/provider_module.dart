import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/provider/impl/auth_provider_impl.dart';
import 'package:network/src/provider/impl/client_provider_impl.dart';

@module
abstract class NetworkProvidersModule {

  @lazySingleton
  AuthProvider provideAuthProvider(Dio apiClient) {
    return AuthProviderImpl(apiClient);
  }

  @lazySingleton
  ClientProvider provideClientProvider(Dio apiClient){
    return ClientProviderImpl(authClient: apiClient);
  }

}
