import 'dart:developer';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:model/model.dart';
import '../../../navigation.dart';

class MainNavigationImpl extends MainNavigation {
  MainNavigationImpl({required this.appRouter});

  final AppRouter appRouter;

  @override
  Future<void> navigateAuthPage() {
    return appRouter.replaceAll([const AuthRoute()]);
  }

  @override
  Future<void> navigateMainPage({AuthType? type}) async{
    log('navigateMainPage type: $type');
    if(type == AuthType.driver) {
      return await appRouter.replaceAll([MainRoute(pages: RouteUtils.getTrashRoutes(), icons: [
        AppIcons.menu02,
        AppIcons.buy,
        AppIcons.historySvg,
        AppIcons.partnersSvg,
        // AppIcons.reportSvg,
      ], routes: [
        LocaleKeys.orders,
        LocaleKeys.buy,
        LocaleKeys.history,
        LocaleKeys.profile,
        // LocaleKeys.reports,
        // LocaleKeys.profile.tr(context: context)
      ])]);
    } else {
      return await appRouter.replaceAll([MainRoute(pages: RouteUtils.getPartnerRoutes(), icons: [
        AppIcons.home01,
        AppIcons.menu02,
        AppIcons.userProfile02,
        AppIcons.historySvg,
      ], routes: [
        LocaleKeys.home,
        LocaleKeys.buy,
        LocaleKeys.profile,
        LocaleKeys.history
        // LocaleKeys.profile.tr(context: context)
      ])]);
    }

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

  @override
  Future<void> navigatePaymentPage(BuyReq param) {
    return appRouter.navigate(PaymentWithCardRoute(params: param));
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
  Future<void> navigateBuyPage(OrderModel? params,String type,ActiveHistory? historyOrder) {
    return appRouter.push(BuyRoute(param: params,type: type,historyOrder: historyOrder));
  }

  @override
  Future<dynamic> navigateAddCustomerPage() async{
    return await appRouter.push<dynamic>(const AddCustomerRoute());
  }

  @override
  Future<void> navigatePriceChangerPage(String title) {
    return appRouter.push(PriceChangerRoute(title: title));
  }

  @override
  Future<void> navigateAddCommentPage() {
    return appRouter.navigate(const AddCommentRoute());
  }
}