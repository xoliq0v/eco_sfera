import 'package:auto_route/src/route/page_route_info.dart';
import 'package:feature_home/feature_home.dart';
import 'package:navigation/src/routes/main_routes.dart';

class MainRoutesImpl extends MainRoutes {
  @override
  PageRouteInfo getConfirmedHistoryPage() {
    return const AdmissionsHistoryRoute();
  }

  @override
  PageRouteInfo getHomePage() {
    return const HomeRoute();
  }

  @override
  PageRouteInfo getOrderPage() {
    return OrdersRoute();
  }

  @override
  PageRouteInfo getPaymentPage() {
    return BuyRoute();
  }

  @override
  PageRouteInfo getRoadMapPage() {
    return const RoadMapRoute();
  }

  @override
  PageRouteInfo goAddCustomerPage() {
    return const AddCustomerRoute();
  }

  @override
  PageRouteInfo getPartnersPage() {
    return const PartnersRoute();
  }

  @override
  PageRouteInfo getReportPage() {
    return const ReportRoute();
  }

  @override
  PageRouteInfo getPresentationPage() {
    return const PresentationRoute();
  }

  @override
  PageRouteInfo getProfilePage() {
    return const ProfileRoute();
  }

}