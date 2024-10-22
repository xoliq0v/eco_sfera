import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.cupertino(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: ChooseLanguageRoute.page,),
    AutoRoute(page: BoardingRoute.page,),
    AutoRoute(page: AuthRoute.page,),
    // AutoRoute(page: NoInternetRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(
      page: NavigationRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: OrdersRoute.page),
        AutoRoute(page: BuyRoute.page,),
        AutoRoute(page: AdmissionsHistoryRoute.page),
        //
        AutoRoute(page: RoadMapRoute.page),
        AutoRoute(page: PolygonRoute.page),
        AutoRoute(page: ReportRoute.page),
      ]
    ),
    AutoRoute(page: ProfileRoute.page,),
    AutoRoute(page: PaymentRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: MyAccountRoute.page),
    AutoRoute(page: OrderCardRoute.page),
    AutoRoute(page: SignatureRoute.page),
    AutoRoute(page: MapRouteRoute.page),
    // AutoRoute(page: SecondaryMain.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}