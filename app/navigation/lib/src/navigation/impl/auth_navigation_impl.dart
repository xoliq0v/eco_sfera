import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigation/src/app_router.dart';
import 'package:navigation/src/navigation/auth_navigation.dart';

class AuthNavigationImpl extends AuthNavigation {
  AuthNavigationImpl({required this.appRouter});

  final AppRouter appRouter;

  @override
  Future<void> navigateAuthPage() {
    return appRouter.navigate(const AuthRoute());
  }

  @override
  Future<void> navigateCategoryPage() {
    return appRouter.replaceAll([const CategoryRoute()]);
  }

  @override
  Future<void> navigateChooseLangPage() {
    return appRouter.replaceAll([const ChooseLanguageRoute()]);
  }

  @override
  Future<void> navigateLostConnectionPage({required BuildContext context, required void Function(bool p1) onResult}) {
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
  Future<void> navigateBoardingPage() {
    return appRouter.navigate(const BoardingRoute());
  }
}