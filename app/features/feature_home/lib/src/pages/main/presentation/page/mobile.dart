
part of '../../main_page.dart';

class _Mobile extends StatefulWidget {
  /// This params from first app's version ui!
  final List<PageRouteInfo<dynamic>> pages;
  final List<String> icons;
  final List<String> routes;
  const _Mobile({
    super.key,
    required this.pages,
    required this.icons,
    required this.routes
  });

  @override
  State<_Mobile> createState() => Mobile();

}

class Mobile extends State<_Mobile> {

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Platform.isIOS,
      replacement: _View(pages: widget.pages,icons: widget.icons,routes: widget.routes,),
      child: CupertinoScaffold(
        overlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
        ),
        topRadius: const Radius.circular(10),
        body: _View(pages: widget.pages,icons: widget.icons,routes: widget.routes,),
      ),
    );
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
            if (index == 3) {
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
