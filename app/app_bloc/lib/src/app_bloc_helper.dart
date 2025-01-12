import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';

mixin AppBlocHelper {
  static InternetConnectivityController getInternetConnectivityController() {
    return GetIt.I.get<InternetConnectivityController>();
  }

  static AuthCubit getAuthCubit() {
    return GetIt.I.get<AuthCubit>();
  }

  static ProfileCubit getProfileCubit(){
    return GetIt.I.get<ProfileCubit>();
  }

  static LogoutCubit provideLogOutCubit(){
    return GetIt.I.get<LogoutCubit>();
  }

  static LogoutCubit getLogoutCubit(){
    return GetIt.I.get<LogoutCubit>();
  }

  static OrderCubit getOrderCubit(){
    return GetIt.I.get<OrderCubit>();
  }

  static CustomerCubit getCustomerCubit(){
    return GetIt.I.get<CustomerCubit>();
  }

  static PostCustomerCubit getPostCustomerCubit(){
    return GetIt.I.get<PostCustomerCubit>();
  }

  static CustomerPaginationCubit getCustomerPaginationCubit(){
    return GetIt.I.get<CustomerPaginationCubit>();
  }

  static LocationServiceCubit getLocationServiceCubit(){
    return GetIt.I.get<LocationServiceCubit>();
  }

  static BuyCubit getBuyCubit(){
    return GetIt.I.get<BuyCubit>();
  }

  static HistoryPaginationCubit getHistoryCubit(){
    return GetIt.I.get<HistoryPaginationCubit>();
  }

  static ActiveHistoryCubit getActiveHistory(){
    return GetIt.I.get<ActiveHistoryCubit>();
  }

  static ThemeChangerCubit getThemeChangeCubit(){
    return GetIt.I.get<ThemeChangerCubit>();
  }

  static RegionCubit getRegionCubit(){
    return GetIt.I.get<RegionCubit>();
  }

  static PartnerPaginationCubit getPartnerPaginationCubit(){
    return GetIt.I.get<PartnerPaginationCubit>();
  }
}