
import 'package:core/core.dart';
import 'package:feature_home/feature_home.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen|Page,Route',
  modules: [FeatureHomeModule],
)
class AppRouter extends _$AppRouter {
  // AppRouter({
  //   required this.bottomNavigationGuard,
  // });

  // final CategoryDetailGuard bottomNavigationGuard;

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: SplashRoute.page,initial: true),
      AutoRoute(page: ChooseLanguageRoute.page,),
      AutoRoute(page: CategoryRoute.page,),
      AutoRoute(page: BoardingRoute.page,),
      AutoRoute(page: AuthRoute.page,),

      AutoRoute(
        page: MainRoute.page,
        children: [
          AutoRoute(page: HomeRoute.page,),
          AutoRoute(page: BuyRoute.page,),
          AutoRoute(page: OrdersRoute.page,),
          AutoRoute(page: ProfileRoute.page,),
          AutoRoute(page: AdmissionsHistoryRoute.page),
        ]
      ),
      AutoRoute(page: ProfileRoute.page,),
      AutoRoute(page: PaymentRoute.page),
      AutoRoute(page: SettingsRoute.page),
      AutoRoute(page: MyAccountRoute.page),
      AutoRoute(page: OrderCardRoute.page),
      AutoRoute(page: SignatureRoute.page),
      AutoRoute(page: MapRouteRoute.page),
    ];
  }


}