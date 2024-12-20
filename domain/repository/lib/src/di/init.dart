import 'dart:async';

import 'package:core/core.dart';
import 'package:map_service/map_service.dart';
import 'package:network/network.dart';
import 'package:database/database.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/repository/impl/auth_repo_impl.dart';
import 'package:repository/src/repository/impl/buy_repo_impl.dart';
import 'package:repository/src/repository/impl/customer_repo_impl.dart';
import 'package:repository/src/repository/impl/history_repo_impl.dart';
import 'package:repository/src/repository/impl/location_repo_impl.dart';
import 'package:repository/src/repository/impl/order_repo_impl.dart';
import 'package:repository/src/repository/impl/session_repo_impl.dart';
import 'package:repository/src/repository/impl/user_repo_impl.dart';

import '../repository/history_repo.dart';

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
      ){
    return UserRepositoryImpl(
        userProfileDAO: userProfileDAO,
        clientProvider: clientProvider
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
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
