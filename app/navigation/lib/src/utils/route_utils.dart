import 'package:core/core.dart';
import '../routes/main_routes.dart';
mixin RouteUtils {
  static List<PageRouteInfo> getTrashRoutes() {
    final mainRoutes = GetIt.I.get<MainRoutes>();
    return [
      mainRoutes.getOrderPage(),
      mainRoutes.getPaymentPage(),
      mainRoutes.getConfirmedHistoryPage(),
      mainRoutes.getPartnersPage(),
      // mainRoutes.getReportPage()
      // mainRoutes.getConfirmedHistoryPage(),
    ];
  }
  static List<PageRouteInfo> getPartnerRoutes() {
    final mainRoutes = GetIt.I.get<MainRoutes>();
    return [
      mainRoutes.getOrderPage(),
      mainRoutes.getPresentationPage(),
      mainRoutes.getConfirmedHistoryPage(),
      mainRoutes.getProfilePage(),
    ];
  }

}
