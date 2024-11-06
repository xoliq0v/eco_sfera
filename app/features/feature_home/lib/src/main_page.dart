import 'dart:io';

import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class MainPage extends StatefulWidget implements AutoRouteWrapper {
  final List<PageRouteInfo<dynamic>> pages;
  final List<String> icons;
  final List<String> routes;
  const MainPage({
    super.key,
    required this.pages,
    required this.icons,
    required this.routes
  });

  @override
  State<MainPage> createState() => _NavigationState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetConnectivityController>(
          create: (context) {
            return AppBlocHelper.getInternetConnectivityController();
          },
        ),
      ],
      child: this,
    );
  }
}

class _NavigationState extends State<MainPage> {

  final connectionLock = Lock();

  bool hasConnection = true;
  bool isLostConnectionPage = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetConnectivityController,
        InternetConnectivityControllerState>(
      listener: (context, state) {
        state.mapOrNull(
          connected: (value) {
            hasConnection = true;
          },
          disconnected: (value) {
            hasConnection = false;
            navigateLostConnection();
          },
        );
      },
      child: Visibility(
        visible: Platform.isIOS,
        replacement: _View(pages: widget.pages,icons: widget.icons,routes: widget.routes,),
        child: CupertinoScaffold(
          overlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Theme.of(context).brightness,
          ),
          topRadius: const Radius.circular(10),
          body: _View(pages: widget.pages,icons: widget.icons,routes: widget.routes,),
        ),
      ),
    );
  }

  Future<void> navigateLostConnection() async {
    await connectionLock.synchronized(() async {
      if (isLostConnectionPage || hasConnection) return;
      isLostConnectionPage = true;
      await NavigationUtils.getMainNavigator().navigateLostConnectionPage(
        context: context,
        onResult: (p0) {},
      );
      isLostConnectionPage = false;
    });
  }

}

class _View extends StatefulWidget {
  final List<PageRouteInfo<dynamic>> pages;
  final List<String> icons;
  final List<String> routes;
  const _View({
    super.key,
    required this.pages,
    required this.icons,
    required this.routes
  });

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> with TickerProviderStateMixin {

  late MotionTabBarController motionTabBarController;
  int lastIndex = 0;

  @override
  void initState() {
    motionTabBarController = MotionTabBarController(length: widget.pages.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    motionTabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: widget.pages,
      bottomNavigationBuilder: (_, tabsRouter) {
        return MotionTabBar(
          controller: motionTabBarController,
          initialSelectedTab: widget.routes.first,
          labels: widget.routes,
          svgIconPaths: widget.icons,
          tabSize: 50,
          tabBarHeight: 60,
          textStyle: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
          tabBarColor: Theme.of(context).colorScheme.background,
          tabIconColor: AppColors.main,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: AppColors.cactusWater,
          tabIconSelectedColor: AppColors.main,
          onTabItemSelected: (int index){
            if (index == 4) {
              motionTabBarController.index = lastIndex;
              navigateProfilePage();
            } else {
              lastIndex = index;
              tabsRouter.setActiveIndex(index);
            }
          },
        );
      },
    );
  }

  Future<void> navigateProfilePage() async{
    return NavigationUtils.getMainNavigator().navigateProfilePage();
  }
}
