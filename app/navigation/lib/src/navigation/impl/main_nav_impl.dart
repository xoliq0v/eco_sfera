import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/src/app_router.dart';
import 'package:navigation/src/navigation/main_navigation.dart';

class MainNavigationImpl extends MainNavigation {
  MainNavigationImpl({required this.appRouter});

  final AppRouter appRouter;

  @override
  Future<void> navigateAuthPage() {
    return appRouter.replaceAll([const AuthRoute()]);
  }

  @override
  Future<void> navigateMainPage({required List<PageRouteInfo<dynamic>> pages, required List<String> icons, required List<String> routes}) {
    return appRouter.navigate(MainRoute(pages: pages, icons: icons, routes: routes));
  }

  @override
  Future<void> navigateLostConnectionPage({required BuildContext context, required void Function(bool p1) onResult}) async {
    return context.showFullScreenPage(
      builder: (controller) {
        return LostConnectionPage(
          onResult: (p0) async {
            if (p0) {
              await controller.dismiss();
            }
            onResult.call(p0);
          },
        );
      },
    );
  }

  @override
  Future<void> navigateProfilePage() {
    return appRouter.navigate(const ProfileRoute());
  }

  @override
  Future<void> navigatePaymentPage() {
    return appRouter.navigate(const PaymentRoute());
  }

  @override
  Future<void> navigateOrderCardPage() {
    return appRouter.navigate(const OrderCardRoute());
  }

  @override
  Future<void> navigateSignaturePage() {
    return appRouter.navigate(const SignatureRoute());
  }

  @override
  Future<void> navigateMapRoutePage() {
    return appRouter.navigate(const MapRouteRoute(),);
  }

  @override
  Future<void> navigateMyAccountPage() {
    return appRouter.navigate(const MyAccountRoute());
  }

  @override
  Future<void> navigateSettingsPage() {
    return appRouter.navigate(const SettingsRoute());
  }

  @override
  Future<void> navigateBuyPage() {
    return appRouter.push(BuyRoute());
  }


}