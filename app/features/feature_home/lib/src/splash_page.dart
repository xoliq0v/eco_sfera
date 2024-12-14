import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:use_case/use_case.dart';

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
  final getTokenUseCase = GetIt.I<GetToken>();

  @override
  void initState() {
    super.initState();
    checkTokenAndNavigate();
  }

  Future<void> checkTokenAndNavigate() async {
    // Fetch the token using your use case (adjust based on your use case implementation)
    // final token = await GetTokenUseCase().call();
    final token = await getTokenUseCase.get();

    if (token != null && token.isNotEmpty) {
      // If token exists, navigate to the main page
      navigateMainPage(context);
    } else {
      // If no token, check connectivity and proceed as before
      isFinished = true;
      navigateNext(context);
    }
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
      child: Material(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                AppIcons.appIcon,
                width: 60,
                height: 60,
              ),
              10.horizontalSpace,
              Text(
                LocaleKeys.appName.tr(context: context),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigateNext(BuildContext context) async {
    await _navigateLock.synchronized(() async {
      if (!isFinished || !context.mounted || isLostConnectionPage) return;
      switch (hasConnection) {
        case true:
          await navigateChooseLangPage(context);
          break;
        case false:
          await navigateLostConnectionPage(context);
          break;
        case null:
          break;
      }
    });
  }

  Future<void> navigateMainPage(BuildContext context) async{
    return await NavigationUtils.getMainNavigator().navigateMainPage(pages: RouteUtils.getTrashRoutes(), icons: [
      AppIcons.menu02,
      AppIcons.buy,
      AppIcons.historySvg,
      AppIcons.profileSvg
    ], routes: [
      LocaleKeys.orders.tr(context: context),
      LocaleKeys.buy.tr(context: context),
      LocaleKeys.history.tr(context: context),
      LocaleKeys.profile.tr(context: context),
      // LocaleKeys.profile.tr(context: context)
    ]);
  }

  Future<void> navigateChooseLangPage(BuildContext context) async {
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
