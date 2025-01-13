
import 'dart:async';

import '../../app_bloc.dart';
import 'package:app_bloc/src/bloc/buy/buy_cubit.dart';
import 'package:app_bloc/src/bloc/customer/customer_cubit.dart';
import 'package:app_bloc/src/bloc/customer/post_customer_cubit.dart';
import 'package:app_bloc/src/bloc/history/history_pagination_cubit.dart';
import '../bloc/customer/get_region_cubit.dart';
import '../bloc/order/handler.dart';
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
      GetToken getToken,
      GetAuthType getType,
      FetchPartnerProfile fetchPartnerProfile,
      GetPartnerProfile getPartnerProfile,
  ){
    return ProfileCubit(fetchUserProfile: fetchUserProfile, getUserProfile: getUserProfile,getToken: getToken,getType: getType, fetchPartnerProfile: fetchPartnerProfile, getPartnerProfile: getPartnerProfile);
  }

  LogoutCubit provideLogOutCubit(Logout logout){
    return LogoutCubit(logout);
  }

  OrderCubit provideOrderCubit(GetOrder getOrder,FCMTokenRefresh fcm,WatchPost watchPost){
    return OrderCubit(getOrder,fcm, watchPost);
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

  BuyCubit provideBuyCubit(Buy _buy,FetchBuyPageParams _fetchBuyPageParams, SearchCustomer search,GetUserProfile profile){
    return BuyCubit(_buy,search, _fetchBuyPageParams,profile);
  }

  HistoryPaginationCubit provideHistoryPaginationCubit(
      FetchHistory _fetchHistory
      ){
    return HistoryPaginationCubit(_fetchHistory, initialPageSize: 5);
  }

  ActiveHistoryCubit provideActiveHistory(GetActiveHistory get){
    return ActiveHistoryCubit(get, initialPageSize: 5);
  }

  ThemeChangerCubit provideThemeChangCubit(){
    return ThemeChangerCubit();
  }

  FCMHandler provideHandler(){
    return FCMHandler();
  }

  RegionCubit provideRegionCubit(GetRegions getReg){
    return RegionCubit(getReg);
  }

  PartnerPaginationCubit providePaginationPartnerCubit(FetchPartners fetch){
    return PartnerPaginationCubit(fetch,initialPageSize: 5);
  }
}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
