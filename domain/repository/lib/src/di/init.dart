import 'dart:async';

import 'package:core/core.dart';
import 'package:map_service/map_service.dart';
import 'package:network/network.dart';
import 'package:database/database.dart';
import '../../repository.dart';
import '../repository/impl/auth_repo_impl.dart';
import '../repository/impl/buy_repo_impl.dart';
import '../repository/impl/history_repo_impl.dart';
import '../repository/impl/location_repo_impl.dart';
import '../repository/impl/order_repo_impl.dart';
import '../repository/impl/session_repo_impl.dart';
import '../repository/impl/user_repo_impl.dart';

import '../repository/history_repo.dart';
import '../repository/impl/customer_repo_impl.dart';
import '../repository/impl/partner_repo_impl.dart';

@module
abstract class RepositoryModule {

  @lazySingleton
  AuthRepository provideAuthRepository(
      AuthProvider authProvider,
      ClientProvider clientProvider
      ){
    return AuthRepoImpl(
        authProvider: authProvider,
        clientProvider: clientProvider
    );
  }

  @lazySingleton
  UserRepository provideUserRepository(
      ClientProvider clientProvider,
      UserProfileDAO userProfileDAO,
      BalanceDao balanceDao
      ){
    return UserRepositoryImpl(
        userProfileDAO: userProfileDAO,
        clientProvider: clientProvider,
        balanceDao: balanceDao
    );
  }

  @lazySingleton
  SessionRepository provideSessionRepository(
      AppStorage appStorage,
      SecureStorage secureStorage,
      MyObjectBox appDatabase,
      ){
    return SessionRepositoryImpl(appDatabase: appDatabase, appStorage: appStorage, secureStorage: secureStorage);
  }
  
  @lazySingleton
  OrderRepo provideOrderRepository(
      OrderProvider orderProvider
      ){
    return OrderRepoImpl(orderProvider: orderProvider);
  }

  @lazySingleton
  CustomerRepository provideCustomerRepository(
      CustomerProvider customerProvider
      ){
    return CustomerRepositoryImpl(customerProvider: customerProvider);
  }

  @lazySingleton
  LocationRepository provideLocationRepository(
      LocationService locationService
      ){
    return LocationRepoImpl(locationService: locationService);
  }

  @lazySingleton
  BuyRepo provideBuyRepository(
      BuyProvider buyProvider,
      TrashProvider trashProvider
      ){
    return BuyRepoImpl(buyProvider: buyProvider,trashProvider: trashProvider);
  }

  @lazySingleton
  HistoryRepo provideHistoryRepository(
      HistoryProvider historyProvider
      ){
    return HistoryRepoImpl(historyProvider: historyProvider);
  }

  @lazySingleton
  PartnerRepo providePartnerRepository(
      PartnerProvider partnerProvider,
      PartnerProfileDAO partnerProfileDAO,
      TrashProvider trashProvider
      ){
    return PartnerRepoImpl(partnerProvider: partnerProvider, partnerProfileDAO: partnerProfileDAO, trashProvider: trashProvider);
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
