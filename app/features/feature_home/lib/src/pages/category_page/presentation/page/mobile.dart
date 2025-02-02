part of '../../category_page.dart';

class _Mobile extends StatelessWidget {
  const _Mobile();

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
                      // navigateTrashMainPage(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.trash02),
                        5.horizontalSpace,
                        Text(LocaleKeys.waste.tr(context: context),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
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
                      // navigateSecondaryMainPage(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.iconParkRecycling),
                        5.horizontalSpace,
                        Text(LocaleKeys.secondary.tr(context: context),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
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

  // Future<void> navigateTrashMainPage(BuildContext context) async{
  //   return await NavigationUtils.getMainNavigator().navigateMainPage(pages: RouteUtils.getTrashRoutes(), icons: [
  //     AppIcons.home03,
  //     AppIcons.activity,
  //     AppIcons.home01,
  //     AppIcons.file01
  //   ], routes: [
  //     LocaleKeys.home.tr(context: context),
  //     LocaleKeys.roadMap.tr(context: context),
  //     LocaleKeys.payment.tr(context: context),
  //     LocaleKeys.history.tr(context: context),
  //     // LocaleKeys.profile.tr(context: context)
  //   ]);
  // }
  //
  // Future<void> navigateSecondaryMainPage(BuildContext context) async{
  //   return await NavigationUtils.getMainNavigator().navigateMainPage(pages: RouteUtils.getPartnerRoutes(), icons: [
  //     AppIcons.home03,
  //     AppIcons.menu02,
  //     AppIcons.coinsRotate,
  //     AppIcons.clockForward,
  //     AppIcons.userProfile02
  //   ], routes: [
  //     LocaleKeys.home.tr(context: context),
  //     LocaleKeys.menu.tr(context: context),
  //     LocaleKeys.payment.tr(context: context),
  //     LocaleKeys.history.tr(context: context),
  //     LocaleKeys.profile.tr(context: context)
  //   ]);
  // }
}
