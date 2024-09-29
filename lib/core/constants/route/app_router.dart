import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: ChooseLanguageRoute.page,),
    AutoRoute(page: BoardingRoute.page,),
    AutoRoute(page: AuthRoute.page,),
    AutoRoute(page: NoInternetRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(
      path: '/navigation',
      page: NavigationRoute.page,
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'orders', page: OrdersRoute.page),
        AutoRoute(path: 'buy', page: BuyRoute.page,),
        AutoRoute(path: 'admissions', page: AdmissionsHistoryRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
      ]
    ),
    AutoRoute(page: PaymentRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: MyAccountRoute.page),
    // AutoRoute(page: SecondaryMain.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}