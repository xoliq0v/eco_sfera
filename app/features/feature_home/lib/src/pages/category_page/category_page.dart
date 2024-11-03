import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:navigation/navigation.dart';

import '../auth/widget/eco_service_item.dart';

@RoutePage()
class CategoryPage extends StatefulWidget implements AutoRouteWrapper {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _MainPageState();

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

class _MainPageState extends State<CategoryPage> {

  final connectionLock = Lock();

  bool hasConnection = true;
  bool isLostConnectionPage = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            10.horizontalSpace,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 8,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.2,
                    child: EcoServiceItem(
                      image: AppIcons.orders,
                      title: LocaleKeys.orders.tr(context: context),
                      onClick: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.2,
                    child: EcoServiceItem(
                      image: AppIcons.buying,
                      title: LocaleKeys.buy.tr(context: context),
                      onClick: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.2,
                    child: EcoServiceItem(
                      image: AppIcons.history,
                      title: LocaleKeys.history.tr(context: context),
                      onClick: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.2,
                    child: EcoServiceItem(
                      image: AppIcons.partners,
                      title: LocaleKeys.partners.tr(context: context),
                      onClick: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2.4,
                    child: EcoServiceItem(
                      image: AppIcons.roadMap,
                      title: LocaleKeys.roadMap.tr(context: context),
                      itemType: ItemType.large,
                      onClick: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1.2,
                    child: EcoServiceItem(
                      image: AppIcons.report,
                      title: LocaleKeys.reports.tr(context: context),
                      onClick: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1.2,
                    child: EcoServiceItem(
                      image: AppIcons.polygon,
                      title: LocaleKeys.polygon.tr(context: context),
                      onClick: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1.2,
                    child: EcoServiceItem(
                      image: AppIcons.profile,
                      title: LocaleKeys.profile.tr(context: context),
                      onClick: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                children: [
                  EcoMaterialButton(
                    minWidth: double.maxFinite,
                    onPressed: () {
                      // context.router.navigate(NavigationRoute(params: firstParam(l10n)),);
                      navigateTrashMainPage();
                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.trash02),
                        5.horizontalSpace,
                        Text(LocaleKeys.waste.tr(context: context))
                      ],
                    ),
                    // icon: Icons.delete_outline,
                  ),
                  SizedBox(height: 8.h),
                  EcoMaterialButton(
                    minWidth: double.maxFinite,
                    onPressed: () {
                      // context.router.navigate(NavigationRoute(
                      //   params: MainNavigationImpl));
                      navigateSecondaryMainPage();
                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.iconParkRecycling),
                        5.horizontalSpace,
                        Text(LocaleKeys.secondary.tr(context: context))
                      ],
                    ),
                    // icon: Icons.recycling,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigateTrashMainPage() async{
    return await NavigationUtils.getMainNavigator().navigateMainPage(pages: RouteUtils.getTrashRoutes(), icons: [
              AppIcons.home03,
              AppIcons.activity,
              AppIcons.home01,
              AppIcons.file01
    ], routes: [
      LocaleKeys.home.tr(context: context),
      LocaleKeys.menu.tr(context: context),
      LocaleKeys.payment.tr(context: context),
      LocaleKeys.history.tr(context: context),
      // LocaleKeys.profile.tr(context: context)
    ]);
  }

  Future<void> navigateSecondaryMainPage() async{
    return await NavigationUtils.getMainNavigator().navigateMainPage(pages: RouteUtils.getSecondaryRoutes(), icons: [
      AppIcons.home03,
      AppIcons.menu02,
      AppIcons.coinsRotate,
      AppIcons.clockForward,
      AppIcons.userProfile02
    ], routes: [
      LocaleKeys.home.tr(context: context),
      LocaleKeys.menu.tr(context: context),
      LocaleKeys.payment.tr(context: context),
      LocaleKeys.history.tr(context: context),
      LocaleKeys.profile.tr(context: context)
    ]);
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