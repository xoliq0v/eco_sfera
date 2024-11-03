import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter/material.dart';

import 'constants/app_image.dart';

@RoutePage()
class SplashScreen extends StatefulWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<InternetConnectivityController>(
      create: (context) => AppBlocHelper.getInternetConnectivityController(),
      child: this,
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFinished = false;
  bool? hasConnection;
  bool isLostConnectionPage = false;

  final _navigateLock = Lock();

  @override
  void initState() {
    isFinished = true;
    navigateNext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectivityController, InternetConnectivityControllerState>(
      listener: (context, state) {
        state.mapOrNull(
          connected: (value) {
            hasConnection = true;
            navigateNext(context);
          },
          disconnected: (value) {
            hasConnection = false;
            navigateNext(context);
          },
        );
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.logo,
              width: 100,
              height: 100,
            ),
            Text(
              LocaleKeys.appName.tr(context: context),
              style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> navigateNext(BuildContext context) async {
    await _navigateLock.synchronized(() async {
      if (!isFinished || !context.mounted || isLostConnectionPage) return;
      switch (hasConnection) {
        case true:
          await navigateAuthPage(context);
        case false:
          await navigateLostConnectionPage(context);
        case null:
          break;
      }
    });
  }

  Future<void> navigateAuthPage(BuildContext context) async {
    return NavigationUtils.getAuthNavigator().navigateChooseLangPage();
  }

  Future<void> navigateLostConnectionPage(BuildContext context) async {
    isLostConnectionPage = true;
    await NavigationUtils.getMainNavigator().navigateLostConnectionPage(
      context: context,
      onResult: (p0) {},
    );
    return NavigationUtils.getAuthNavigator().navigateChooseLangPage();
  }
}
