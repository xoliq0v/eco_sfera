import 'package:flutter/material.dart';

abstract class AuthNavigation {

  Future<void> navigateAuthPage();

  Future<void> navigateChooseLangPage();

  Future<void> navigateCategoryPage();

  Future<void> navigateLostConnectionPage({
    required BuildContext context,
    required void Function(bool) onResult,
  });

  Future<void> navigateBoardingPage();

}