part of '../../main_page.dart';

class TabTapPosition {
  static Offset? tapPosition;

  static void setTapPosition(Offset position) {
    tapPosition = position;
  }
}


class _Mobile extends StatefulWidget {
  /// This params from first app's version UI
  final List<PageRouteInfo<dynamic>> pages;
  final List<String> icons;
  final List<String> routes;
  const _Mobile({
    required this.pages,
    required this.icons,
    required this.routes,
  });

  @override
  State<_Mobile> createState() => Mobile();
}

class Mobile extends State<_Mobile> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Platform.isIOS,
      replacement: _View(
        pages: widget.pages,
        icons: widget.icons,
        routes: widget.routes,
      ),
      child: CupertinoScaffold(
        overlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
        ),
        topRadius: const Radius.circular(10),
        body: _View(
          pages: widget.pages,
          icons: widget.icons,
          routes: widget.routes,
        ),
      ),
    );
  }
}

class _View extends StatefulWidget {
  final List<PageRouteInfo<dynamic>> pages;
  final List<String> icons;
  final List<String> routes;
  const _View({
    required this.pages,
    required this.icons,
    required this.routes,
  });

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> with TickerProviderStateMixin {
  late MotionTabBarController motionTabBarController;
  int lastIndex = 0;

  Widget slidePageTransition(BuildContext context, Widget child, Animation<double> animation) {
    final revealAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOutCubic,
    );

    final fadeAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    );

    return AnimatedBuilder(
      animation: Listenable.merge([revealAnimation, fadeAnimation]),
      builder: (context, child) {
        final screenSize = MediaQuery.of(context).size;
        final maxRadius = screenSize.longestSide * 1.5;
        final radius = revealAnimation.value * maxRadius;
        final center = TabTapPosition.tapPosition ?? screenSize.center(Offset.zero);

        return FadeTransition(
            opacity: fadeAnimation,
            child: child
        );
      },
      child: child,
    );
  }
  // Update tab router when bloc state changes
  // final tabsRouter = AutoTabsRouter.of(context);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: widget.pages,
      transitionBuilder: slidePageTransition,
      animationDuration: const Duration(milliseconds: 200),
      animationCurve: Curves.easeInOutCubic,
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: (index){
            context.read<NavigationBloc>().add(UpdateTabIndex(index));
            lastIndex = index;
            tabsRouter.setActiveIndex(index);
          },
          destinations: List.generate(widget.icons.length, (index) {
            final icon = widget.icons[index];
            final label = widget.routes[index];
            return NavigationDestination(
              selectedIcon: SvgPicture.asset(
                width: 25,
                icon,
                color: context.colorScheme.surface,
              ),
              icon: SvgPicture.asset(
                icon,color: context.colorScheme.secondary,
              ),
              label: label.tr(context: context),
            );
          }),
        );
      },
    // bottomNavigationBuilder: (_, tabsRouter) {
      //   return GestureDetector(
      //     onTapDown: (details){
      //       TabTapPosition.setTapPosition(details.globalPosition);
      //     },
      //     child: MotionTabBar(
      //       controller: motionTabBarController,
      //       initialSelectedTab: widget.routes.first.tr(context: context),
      //       labels: widget.routes.map((str)=> str.tr(context: context)).toList(),
      //       svgIconPaths: widget.icons,
      //       tabSize: 50,
      //       tabBarHeight: 60,
      //       textStyle: TextStyle(
      //         fontSize: 12,
      //         color: Theme.of(context).colorScheme.primary,
      //         fontWeight: FontWeight.w500,
      //       ),
      //       tabBarColor: Theme.of(context).colorScheme.background,
      //       tabIconColor: AppColors.main,
      //       tabIconSize: 28.0,
      //       tabIconSelectedSize: 26.0,
      //       tabSelectedColor: AppColors.cactusWater,
      //       tabIconSelectedColor: AppColors.main,
      //       onTabItemSelected: (int index) {
      //         // if (index == 4) {
      //         //   motionTabBarController.index = lastIndex;
      //         //   navigateProfilePage();
      //         // } else {
      //         //   lastIndex = index;
      //         //   tabsRouter.setActiveIndex(index);
      //         // }
      //         context.read<NavigationBloc>().add(UpdateTabIndex(index));
      //         lastIndex = index;
      //         tabsRouter.setActiveIndex(index);
      //       },
      //     ),
      //   );
      // },
    );
  }

  Future<void> navigateProfilePage() async {
    return NavigationUtils.getMainNavigator().navigateProfilePage();
  }
}
