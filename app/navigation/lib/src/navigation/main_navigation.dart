import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class MainNavigation {

  Future<void> navigateMainPage({
    required List<PageRouteInfo<dynamic>> pages,
    required List<String> icons,
    required List<String> routes
  });

  Future<void> navigateAuthPage();

  Future<void> navigateLostConnectionPage({
    required BuildContext context,
    required void Function(bool) onResult,
  });

  Future<void> navigateProfilePage();

  Future<void> navigatePaymentPage();

  Future<void> navigateOrderCardPage();

  Future<void> navigateSignaturePage();

  Future<void> navigateMapRoutePage();

  Future<void> navigateMyAccountPage();

  Future<void> navigateSettingsPage();

  // Future<void> navigateProfilePage();
  //
  // Future<void> navigateAdmissionHistoryPage();
  //
  // Future<void> navigatePaymentPage();


}