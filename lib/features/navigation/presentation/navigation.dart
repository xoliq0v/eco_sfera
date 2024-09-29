import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/libs/motion_tab_bar/motion-tab-bar.dart';
import 'package:eco_sfera/core/libs/motion_tab_bar/motion-tab-controller.dart';
import 'package:eco_sfera/core/singleton/di.config.dart';
import 'package:eco_sfera/features/navigation/presentation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import '../../../core/assets/app_icons.dart';
import '../../../core/assets/theme/app_colors.dart';

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
  int lastIndex = 0;

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
      create: (context) => getIt<NavigationCubit>(),
      child: AutoTabsScaffold(
        routes: [
            const HomeRoute(),
            OrdersRoute(),
            const BuyRoute(),
            const AdmissionsHistoryRoute(),
          ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BlocBuilder<NavigationCubit, int>(
            builder: (context, state) {

              return MotionTabBar(
                controller: motionTabBarController,
                initialSelectedTab: "Home",
                labels: const ["Home", "Menu", "Payment", "History", "Profile"],
                svgIconPaths: const [
                  AppIcons.home03,
                  AppIcons.menu02,
                  AppIcons.coinsRotate,
                  AppIcons.clockForward,
                  AppIcons.userProfile02,
                ],
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
                        // Profile
                        motionTabBarController.index = lastIndex;
                        context.router.push(const ProfileRoute());
                      } else {
                        lastIndex = index;
                        context.read<NavigationCubit>().setTab(index);
                        tabsRouter.setActiveIndex(index);
                      }
                },
              );
            },
          );
        },
      ),
    );
  }
}
