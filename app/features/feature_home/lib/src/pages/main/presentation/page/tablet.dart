
part of '../../main_page.dart';

final GlobalKey navigationKey = GlobalKey();

void changeTabUsingContext(BuildContext context, int index) {
  AutoTabsRouter.of(context).setActiveIndex(index);
}

class _Tablet extends StatefulWidget {
  final List<PageRouteInfo<dynamic>> pages;
  final List<String> icons;
  final List<String> routes;

  const _Tablet({
    required this.pages,
    required this.icons,
    required this.routes,
  });

  @override
  State<_Tablet> createState() => Tablet();
}

class Tablet extends State<_Tablet> with SingleTickerProviderStateMixin {
  // Use ValueNotifier to avoid unnecessary rebuilds
  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> _isNavBarVisibleNotifier = ValueNotifier<bool>(true);
  int _lastIndex = 0;
  static const int _profileIndex = 4;

  late final AnimationController _controller;
  late final Animation<double> _navBarAnimation;
  late final Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200), // Reduced duration for better performance
      vsync: this,
    );

    _navBarAnimation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn, // Using a more performant curve
    ));

    _buttonAnimation = Tween<double>(
      begin: 70,
      end: 20,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _selectedIndexNotifier.dispose();
    _isNavBarVisibleNotifier.dispose();
    super.dispose();
  }

  void _toggleNavBar() {
    _isNavBarVisibleNotifier.value = !_isNavBarVisibleNotifier.value;
    if (_isNavBarVisibleNotifier.value) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        key: navigationKey,
        routes: widget.pages,
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: RepaintBoundary(child: child),
                  ),
                  _buildNavigationBar(tabsRouter),
                ],
              ),
              _buildToggleButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavigationBar(TabsRouter tabsRouter) {
    return AnimatedBuilder(
      animation: _navBarAnimation,
      builder: (context, child) => SizedBox(
        width: 100 - _navBarAnimation.value,
        child: child,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(-2, 0),
            ),
          ],
        ),
        child: _buildNavigationItems(tabsRouter),
      ),
    );
  }

  Widget _buildNavigationItems(TabsRouter tabsRouter) {
    return Padding(
      padding: EdgeInsets.only(top: AppScreen.statusBarHeight + 100),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isNavBarVisibleNotifier,
        builder: (context, isVisible, child) {
          return Opacity(
            opacity: isVisible ? 1.0 : 0.0,
            child: _NavigationItems(
              icons: widget.icons,
              selectedIndexNotifier: _selectedIndexNotifier,
              onTap: (index) => _handleNavigation(index, tabsRouter),
            ),
          );
        },
      ),
    );
  }

  Widget _buildToggleButton() {
    return AnimatedBuilder(
      animation: _buttonAnimation,
      builder: (context, child) => Positioned(
        right: _buttonAnimation.value,
        top: AppScreen.statusBarHeight * 2,
        child: _ToggleButton(
          isVisible: _isNavBarVisibleNotifier.value,
          onTap: _toggleNavBar,
        ),
      ),
    );
  }

  Future<void> _handleNavigation(int index, TabsRouter tabsRouter) async {
    if (index == _profileIndex) {
      _selectedIndexNotifier.value = _lastIndex;
      await NavigationUtils.getMainNavigator().navigateProfilePage();
    } else {
      _lastIndex = index;
      _selectedIndexNotifier.value = index;
      tabsRouter.setActiveIndex(index);
    }
  }
}

// Extracted widgets for better performance
class _NavigationItems extends StatelessWidget {
  final List<String> icons;
  final ValueNotifier<int> selectedIndexNotifier;
  final Function(int) onTap;

  const _NavigationItems({
    required this.icons,
    required this.selectedIndexNotifier,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        icons.length,
            (index) => _NavigationItem(
          icon: icons[index],
          index: index,
          selectedIndexNotifier: selectedIndexNotifier,
          onTap: onTap,
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  final String icon;
  final int index;
  final ValueNotifier<int> selectedIndexNotifier;
  final Function(int) onTap;

  const _NavigationItem({
    required this.icon,
    required this.index,
    required this.selectedIndexNotifier,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        // vertical: 12,
        bottom: index == 0 ? 40.0 : 0,
      ),
      child: InkWell(
        onTap: () => onTap(index),
        child: SizedBox(
          width: 60,
          height: 60,
          child: ValueListenableBuilder<int>(
            valueListenable: selectedIndexNotifier,
            builder: (context, selectedIndex, _) {
              final isSelected = selectedIndex == index;
              return DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? AppColors.cactusWater
                      : Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                    width: 24,
                    height: 24,
                    color: isSelected
                        ? AppColors.main
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onTap;

  const _ToggleButton({
    required this.isVisible,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        height: 60,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(-2, 0),
              ),
            ],
          ),
          child: Center(
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: isVisible ? 0 : 0.5,
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ),
      ),
    );
  }
}

