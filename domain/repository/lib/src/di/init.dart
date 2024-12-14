import 'dart:async';

import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:database/database.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/repository/impl/auth_repo_impl.dart';
import 'package:repository/src/repository/impl/order_repo_impl.dart';
import 'package:repository/src/repository/impl/session_repo_impl.dart';
import 'package:repository/src/repository/impl/user_repo_impl.dart';

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
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
