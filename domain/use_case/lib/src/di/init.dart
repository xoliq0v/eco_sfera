
import 'dart:async';

import 'package:core/core.dart';
import 'package:repository/repository.dart';
import 'package:use_case/src/impl/auth_use_case_impl.dart';
import 'package:use_case/src/impl/buy_use_case_impl.dart';
import 'package:use_case/src/impl/customer_use_case_impl.dart';
import 'package:use_case/src/impl/location_use_case_impl.dart';
import 'package:use_case/src/impl/order_use_case_impl.dart';
import 'package:use_case/src/impl/session_use_case_impl.dart';
import 'package:use_case/use_case.dart';

import '../impl/history_use_case_impl.dart';

@module
abstract class UseCaseModule {

  AuthUseCase provideAuthUseCase(AuthRepository authRepository){
    return AuthImpl(authRepository: authRepository);
  }

  SaveToken provideSaveSession(SessionRepository sessionRepository){
    return SaveTokenImpl(sessionRepository: sessionRepository);
  }

  GetToken provideGetToken(SessionRepository sessionRepository){
    return GetTokenImpl(sessionRepository: sessionRepository);
  }

  FetchUserProfile provideFetchUserProfile(UserRepository userRepository){
    return FetchUserProfileImpl(userRepository: userRepository);
  }

  GetUserProfile provideGetUserProfile(UserRepository userRepository){
    return GetUserProfileImpl(userRepository: userRepository);
  }

  Logout provideLogout(SessionRepository sessionRepository){
    return LogoutImpl(sessionRepository: sessionRepository);
  }

  GetOrder provideGetOrder(OrderRepo orderRepo){
    return GetOrderImpl(orderRepo: orderRepo);
  }

  GetCustomer provideGetCustomer(CustomerRepository customerRepository){
    return GetCustomersImpl(customerRepository: customerRepository);
  }

  PostCustomer providePostCustomer(CustomerRepository customerRepository){
    return PostCustomerImpl(customerRepository: customerRepository);
  }

  GetLocation provideGetLocation(LocationRepository locationRepository){
    return GetLocationImpl(locationRepository: locationRepository);
  }

  Buy provideBuy(BuyRepo buyRepo){
    return BuyImpl(buyRepo: buyRepo);
  }

  FetchBuyPageParams provideBuyPageParams(BuyRepo buyRepo){
    return FetchBuyParamsImpl(buyRepo: buyRepo);
  }

  FetchHistory provideFetchHistory(HistoryRepo historyRepo){
    return FetchHistoryImpl(historyRepo: historyRepo);
  }

  SaveType provideSaveType(SessionRepository sessionRepository){
    return SaveTypeImpl(sessionRepository: sessionRepository);
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
