import 'package:core/core.dart';
import 'package:navigation/src/routes/main_routes.dart';
mixin RouteUtils {
  static List<PageRouteInfo> getTrashRoutes() {
    final mainRoutes = GetIt.I.get<MainRoutes>();
    return [
      mainRoutes.getHomePage(),
      mainRoutes.getRoadMapPage(),
      mainRoutes.getPaymentPage(),
      mainRoutes.getConfirmedHistoryPage(),
    ];
  }
  static List<PageRouteInfo> getSecondaryRoutes() {
    final mainRoutes = GetIt.I.get<MainRoutes>();
    return [
      mainRoutes.getHomePage(),
      mainRoutes.getOrderPage(),
      mainRoutes.getPaymentPage(),
      mainRoutes.getConfirmedHistoryPage(),
    ];
  }

}
