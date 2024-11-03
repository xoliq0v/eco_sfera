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
    return const BuyRoute();
  }

  @override
  PageRouteInfo getProfilePage() {
    return const ProfileRoute();
  }

}