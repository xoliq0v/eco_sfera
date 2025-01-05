
import 'dart:async';

import 'package:core/core.dart';
import 'package:repository/repository.dart';
import '../impl/auth_use_case_impl.dart';
import '../impl/buy_use_case_impl.dart';
import '../impl/customer_use_case_impl.dart';
import '../impl/location_use_case_impl.dart';
import '../impl/order_use_case_impl.dart';
import '../impl/session_use_case_impl.dart';
import '../../use_case.dart';

import '../impl/history_use_case_impl.dart';
import '../impl/parnter_use_case_impl.dart';

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

  FetchPartnerProfile provideFetchPartnerProfile(PartnerRepo partnerRepository) {
    return FetchPartnerProfileImpl(partnerRepo: partnerRepository);
  }

  GetPartnerProfile provideGetPartnerProfile(PartnerRepo partnerRepository) {
    return GetPartnerProfileImpl(partnerRepo: partnerRepository);
  }

  GetAuthType provideGetAuthType(SessionRepository sessionRepository){
    return GetAuthTypeImpl(sessionRepository: sessionRepository);
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
