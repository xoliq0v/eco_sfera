import '../app_bloc.dart';
import 'package:core/core.dart';

import 'bloc/edit_partner/edit_partner_info_cubit.dart';
import 'bloc/partner_comment/partner_comment_cubit.dart';

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

  static TransactionCubit getTransactionCubit(){
    return GetIt.I.get<TransactionCubit>();
  }

  static BalanceCubit getBalanceCubit(){
    return GetIt.I.get<BalanceCubit>();
  }

  static NavigationBloc getNavigationBloc(){
    return GetIt.I.get<NavigationBloc>();
  }

  static TypeBloc getTypeBloc(){
    return GetIt.I.get<TypeBloc>();
  }

  static PartnerOrderCubit getPartnerOrderCubit(){
    return GetIt.I.get<PartnerOrderCubit>();
  }

  static EditPartnerInfoCubit getEditPartnerInfoCubit(){
    return GetIt.I.get<EditPartnerInfoCubit>();
  }

  static PartnerCommentCubit getPartnerCommentCubit(){
    return GetIt.I.get<PartnerCommentCubit>();
  }

  static SubmissionCubit getSubmissionCubit(){
    return GetIt.I.get<SubmissionCubit>();
  }

  static ProductCubit getProductCubit(){
    return GetIt.I.get<ProductCubit>();
  }

  static PartnerTrashCubit getPartnerTrashCubit(){
    return GetIt.I.get<PartnerTrashCubit>();
  }

  static PartnerCompletedHistoryCubit getPartnerCompletedHistoryCubit(){
    return GetIt.I.get<PartnerCompletedHistoryCubit>();
  }

  static PartnerHistoryCubit getPartnerHistoryCubit(){
    return GetIt.I.get<PartnerHistoryCubit>();
  }

  static UserDataCubit getUserDataCubit(){
    return GetIt.I.get<UserDataCubit>();
  }

  static AdCubit getAdCubit(){
    return GetIt.I.get<AdCubit>();
  }
}
