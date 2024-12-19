import 'package:core/core.dart';

abstract class MainRoutes{

  PageRouteInfo getHomePage();

  PageRouteInfo getOrderPage();

  PageRouteInfo getPaymentPage();

  PageRouteInfo getConfirmedHistoryPage();

  PageRouteInfo getRoadMapPage();

  PageRouteInfo goAddCustomerPage();

}