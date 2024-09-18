import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/libs/motion_tab_bar/motion-tab-controller.dart';
import 'package:eco_sfera/core/singleton/di.config.dart';
import 'package:eco_sfera/features/home/presentation/home_screen.dart';
import 'package:eco_sfera/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:eco_sfera/features/navigation/presentation/bloc/navigation_state.dart';
import 'package:eco_sfera/features/orders/presentation/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets/app_icons.dart';
import '../../../core/assets/theme/app_colors.dart';
import '../../../core/libs/motion_tab_bar/motion-tab-bar.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  final List<PageRouteInfo> routes;
  const NavigationScreen({super.key,required this.routes});

  @override
  State<NavigationScreen> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationScreen> with TickerProviderStateMixin {
  late MotionTabBarController motionTabBarController;
  late var l10n;

  @override
  void initState() {

    motionTabBarController = MotionTabBarController(
        length: widget.routes.length,
        vsync: this
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    l10n = context.l10n;

    return BlocProvider(
      create: (context) => getIt<NavigationBloc>(),
      child: AutoTabsRouter.tabBar(
        routes: widget.routes,
        builder: (context,child,tabController){

          return Scaffold(
            body: PageView(
              children: [
                OrdersPage(),
                HomeScreen()
              ],
            ),

            bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context,state){
                return MotionTabBar(
                  controller: motionTabBarController, // ADD THIS if you need to change your tab programmatically
                  initialSelectedTab: "Home",
                  labels: const ["Home", "Menu", "Payment", "History", "Profile"],
                  // icons: const [Icons.dashboard, Icons.home, Icons.people_alt, Icons.settings],
                  svgIconPaths: const [
                    AppIcons.home03,
                    AppIcons.menu02,
                    AppIcons.coinsRotate,
                    AppIcons.clockForward,
                    AppIcons.userProfile02,
                  ],
                  tabSize: 50,
                  tabBarHeight: 60,
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  tabIconColor: AppColors.main,
                  tabIconSize: 28.0,
                  tabIconSelectedSize: 26.0,
                  tabSelectedColor: AppColors.cactusWater,
                  tabIconSelectedColor: AppColors.main,
                  onTabItemSelected: (int value) {
                    motionTabBarController.index = value;
                  },
                );
              },
            ),
          );

        },
      ),
    );
  }
}
