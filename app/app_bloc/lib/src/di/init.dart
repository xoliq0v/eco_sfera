
import 'dart:async';

import 'package:app_bloc/app_bloc.dart';
import 'package:app_bloc/src/bloc/buy/buy_cubit.dart';
import 'package:app_bloc/src/bloc/customer/customer_cubit.dart';
import 'package:app_bloc/src/bloc/customer/post_customer_cubit.dart';
import 'package:app_bloc/src/bloc/history/history_pagination_cubit.dart';
import 'package:app_bloc/src/bloc/order/handler.dart';
import 'package:app_bloc/src/bloc/order/order_cubit.dart';
import 'package:app_bloc/src/bloc/theme/theme_cubit.dart';
import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

@module
abstract class AppBlocModule {

  InternetConnectivityController provideInternetConnectivityController(
      Connectivity connectivity,
      InternetConnectionChecker internetConnectionChecker,
      ) {
    return InternetConnectivityController(
      connectivity,
      internetConnectionChecker,
    );
  }

  AuthCubit provideAuthCubit(
      AuthUseCase authUseCase,
      SaveToken saveSession,
      SaveType saveType,
      FetchUserProfile fetchUserProfile,){
    return AuthCubit(authUseCase, saveSession, saveType, fetchUserProfile);
  }

  ProfileCubit provideProfileCubit(
    GetUserProfile getUserProfile,
    FetchUserProfile fetchUserProfile,
      GetToken getToken
  ){
    return ProfileCubit(fetchUserProfile: fetchUserProfile, getUserProfile: getUserProfile,getToken: getToken);
  }

  LogoutCubit provideLogOutCubit(Logout logout){
    return LogoutCubit(logout);
  }

  OrderCubit provideOrderCubit(GetOrder getOrder){
    return OrderCubit(getOrder);
  }

  PostCustomerCubit providePostCustomerCubit(PostCustomer postCustomer){
    return PostCustomerCubit(postCustomer);
  }

  CustomerCubit provideCustomerCubit(GetCustomer getCustomer){
    return CustomerCubit(getCustomer);
  }

  CustomerPaginationCubit provideCustomerPaginationCubit(GetCustomer getCustomer){
    return CustomerPaginationCubit(initialPageSize: 5,getCustomer);
  }

  LocationServiceCubit provideLocationCubit(GetLocation _getLocation){
    return LocationServiceCubit(_getLocation);
  }

  BuyCubit provideBuyCubit(Buy _buy,FetchBuyPageParams _fetchBuyPageParams){
    return BuyCubit(_buy, _fetchBuyPageParams);
  }

  HistoryPaginationCubit provideHistoryPaginationCubit(
      FetchHistory _fetchHistory
      ){
    return HistoryPaginationCubit(_fetchHistory, initialPageSize: 5);
  }

  ThemeChangerCubit provideThemeChangCubit(){
    return ThemeChangerCubit();
  }

  FCMHandler provideHandler(){
    return FCMHandler();
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
