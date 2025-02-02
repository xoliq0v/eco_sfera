import 'dart:async';

import '../../app_bloc.dart';
import '../bloc/buy/buy_cubit.dart';
import '../bloc/customer/customer_cubit.dart';
import '../bloc/customer/post_customer_cubit.dart';
import '../bloc/history/history_pagination_cubit.dart';
import '../bloc/customer/get_region_cubit.dart';
import '../bloc/order/handler.dart';
import '../bloc/order/order_cubit.dart';
import '../bloc/theme/theme_cubit.dart';
import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

import '../bloc/partner_comment/partner_comment_cubit.dart';

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
      FetchUserProfile fetchUserProfile,
      FetchPartnerProfile partnerProfile){
    return AuthCubit(authUseCase, saveSession, saveType, fetchUserProfile, partnerProfile);
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

  OrderCubit provideOrderCubit(GetOrder getOrder,FCMTokenRefresh fcm,WatchPost watchPost,GetAuthType getType){
    return OrderCubit(getOrder,fcm, watchPost,getType);
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

  BuyCubit provideBuyCubit(Buy _buy,FetchBuyPageParams _fetchBuyPageParams, SearchCustomer search,GetUserProfile profile,FetchBalance fetchBalance,GetBalance getBalance){
    return BuyCubit(_buy,search, _fetchBuyPageParams,profile,fetchBalance,getBalance);
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

  TransactionCubit provideTransactionCubit(GetTransactions get,GetUserProfile user){
    return TransactionCubit(get,user);
  }

  BalanceCubit provideBalanceCubit(GetBalance get, FetchBalance fetch,GetUserProfile profile){
    return BalanceCubit(get, fetch,profile);
  }

  NavigationBloc provideNavigationBloc(){
    return NavigationBloc();
  }

  TypeBloc provideTypeBloc(GetAuthType type){
    return TypeBloc(type);
  }

  ProductCubit provideProductCubit(GetAllProducts getAllProducts){
    return ProductCubit(getAllProducts);
  }

  PartnerOrderCubit providePartnerOrderCubit(GetPartnerOrdersUseCase getPartnerOrdersUseCase,GetAuthType getType,ChangePartnerStatusUseCase changePartnerStatus,ChangeOrderStatusUseCase changeOrderStatus){
    return PartnerOrderCubit(changePartnerStatus,getType,getPartnerOrdersUseCase, changeOrderStatus, initialPageSize: 5);
  }

  EditPartnerInfoCubit provideEditPartnerInfoCubit(PartnerEditUseCase editPartnerInfo,GetPartnerProfile getPartnerProfile){
    return EditPartnerInfoCubit(editPartnerInfo,getPartnerProfile);
  }

  PartnerCommentCubit providePartnerCommentCubit(PostCommentUseCase postComment,GetPartnerComments getPartnerComments,GetAllProducts getAllProducts){
    return PartnerCommentCubit(postComment,getPartnerComments,getAllProducts);
  }

  SubmissionCubit provideSubmissionCubit(GetPartnerDataUseCase getPartnerDataUseCase,CreatePartnerOrderUseCase createPartnerOrderUseCase,GetUserProfile getDriverDataUseCase){
    return SubmissionCubit(getPartnerDataUseCase,createPartnerOrderUseCase,getDriverDataUseCase);
  }

  PartnerTrashCubit providePartnerTrashCubit(PartnerGetTrashUseCase getPartnerTrash,ChangeTrashPriceUseCase changeTrashPrice){
    return PartnerTrashCubit(getPartnerTrash,changeTrashPrice);
  }

  PartnerHistoryCubit providePartnerHistoryCubit(GetPartnerOrdersUseCase getPartnerOrdersUseCase,GetAuthType getType){
    return PartnerHistoryCubit(getPartnerOrdersUseCase,getType, initialPageSize: 5);
  }

  PartnerCompletedHistoryCubit providePartnerCompletedHistoryCubit(GetPartnerOrdersUseCase getPartnerOrdersUseCase,GetAuthType getType){
    return PartnerCompletedHistoryCubit(getPartnerOrdersUseCase,initialPageSize: 5);
  }

  UserDataCubit provideUserDataCubit(GetUserProfile user,GetPartnerProfile partner,GetAuthType type){
    return UserDataCubit(user,partner,type);
  }

  AdCubit provideAdCubit(PostAddUseCase ad){
    return AdCubit(ad);
  }

}

@InjectableInit.microPackage()
FutureOr<void> initMicroPackage() {}
