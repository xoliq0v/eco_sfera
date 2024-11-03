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
    return appRouter.push(const ProfileRoute());
  }



}