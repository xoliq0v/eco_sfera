import 'dart:developer';
import 'dart:io';

import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:design_system/design_system.dart';
import '../../responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation/navigation.dart';

part 'presentation/page/mobile.dart';
part 'presentation/page/tablet.dart';

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
        BlocProvider<NavigationBloc>(
          create: (context) {
            return AppBlocHelper.getNavigationBloc();
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
      child: Responsive(
        tablet: _Tablet(pages: widget.pages, icons: widget.icons, routes: widget.routes),
        mobile: _Mobile(pages: widget.pages, icons: widget.icons, routes: widget.routes),
      )
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
