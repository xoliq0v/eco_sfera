import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/provider/customer_provider.dart';
import 'package:network/src/provider/impl/auth_provider_impl.dart';
import 'package:network/src/provider/impl/client_provider_impl.dart';
import 'package:network/src/provider/impl/customer_dto_provider_impl.dart';
import 'package:network/src/provider/impl/order_provider_impl.dart';
import 'package:network/src/provider/impl/partner_provider_impl.dart';
import 'package:network/src/provider/impl/route_provider_impl.dart';
import 'package:network/src/provider/impl/trash_provider_impl.dart';
import 'package:network/src/provider/partner_provider.dart';
import 'package:network/src/provider/route_provider.dart';
import 'package:network/src/provider/trash_provider.dart';

import '../provider/orders_provider.dart';

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

  @lazySingleton
  CustomerProvider provideCustomerProvider(Dio apiClient){
    return CustomerProviderImpl(apiClient: apiClient);
  }

  @lazySingleton
  PartnerProvider providePartnerProvider(Dio apiClient){
    return PartnerProviderImpl(apiClient: apiClient);
  }


  @lazySingleton
  TrashProvider provideTrashProvider(Dio apiClient){
    return TrashProviderImpl(apiClient: apiClient);
  }

  @lazySingleton
  RouteProvider provideRouteProvider(Dio apiClient){
    return RouteProviderImpl(apiClient: apiClient);
  }

  @lazySingleton
  OrderProvider provideOrderProvider(Dio apiClient){
    return OrderProviderImpl(apiClient: apiClient);
  }

}
