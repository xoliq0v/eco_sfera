import 'package:flutter/material.dart';
import 'package:model/model.dart';

abstract class MainNavigation {

  Future<void> navigateMainPage({
    AuthType type
  });

  Future<void> navigateAuthPage();

  Future<void> navigateLostConnectionPage({
    required BuildContext context,
    required void Function(bool) onResult,
  });

  Future<void> navigateProfilePage();

  Future<void> navigatePaymentPage(BuyReq param);

  Future<void> navigateOrderCardPage();

  Future<void> navigateSignaturePage();

  Future<void> navigateMapRoutePage();

  Future<void> navigateMyAccountPage();

  Future<void> navigateSettingsPage();

  Future<void> navigateBuyPage({OrderModel? params,String type,ActiveHistory? historyOrder,PartnerOrder? partnerOrder} );

  Future<dynamic> navigateAddCustomerPage();

  Future<void> navigatePriceChangerPage(Product product);

  Future<void> navigateAddCommentPage();

  Future<void> navigateSubmissionPage(int partnerId,PartnerItem partner);

  Future<void> navigateAnnouncementPage();


}