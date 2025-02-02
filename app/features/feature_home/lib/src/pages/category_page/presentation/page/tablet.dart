part of '../../category_page.dart';

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: IntrinsicHeight( // This ensures all columns have same height
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TabEcoServiceItem(
                      image: AppIcons.orders,
                      title: LocaleKeys.orders.tr(context: context),
                      onClick: () {},
                    ),
                    TabEcoServiceItem(
                      image: AppIcons.buying,
                      title: LocaleKeys.buy.tr(context: context),
                      onClick: () {},
                    ),
                    TabEcoServiceItem(
                      image: AppIcons.history,
                      title: LocaleKeys.history.tr(context: context),
                      onClick: () {},
                    ),
                  ],
                ),
              ),
                  10.horizontalSpace,
                  Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TabEcoServiceItem(
                    image: AppIcons.partners,
                    title: LocaleKeys.partners.tr(context: context),
                    onClick: () {},
                  ),
                  TabEcoServiceItem(
                    image: AppIcons.report,
                    title: LocaleKeys.reports.tr(context: context),
                    onClick: () {},
                  ),
                  _buildPolygonAndProfileRow(context),
                ],
              ),
            ),
                  10.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TabEcoServiceItem(
                          image: AppIcons.roadMap,
                          title: LocaleKeys.roadMap.tr(context: context),
                          itemType: ItemType.large,
                          onClick: () {},
                        ),
                        5.verticalSpace,
                        _buildEcoButton(
                          context: context,
                          icon: AppIcons.trash02,
                          title: LocaleKeys.waste.tr(context: context),
                          onPressed: () => {},
                        ),
                        5.verticalSpace,
                        _buildEcoButton(
                          context: context,
                          icon: AppIcons.iconParkRecycling,
                          title: LocaleKeys.secondary.tr(context: context),
                          onPressed: () => {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPolygonAndProfileRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TabEcoServiceItem(
            image: AppIcons.polygon,
            title: LocaleKeys.polygon.tr(context: context),
            onClick: () {},
          ),
        ),
        5.horizontalSpace,
        Expanded(
          child: TabEcoServiceItem(
            image: AppIcons.profile,
            title: LocaleKeys.profile.tr(context: context),
            onClick: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildEcoButton({
    required BuildContext context,
    required String icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return EcoMaterialButton(
      minWidth: double.maxFinite,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          5.horizontalSpace,
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  // Future<void> navigateTrashMainPage(BuildContext context) async {
  //   return await NavigationUtils.getMainNavigator().navigateMainPage(
  //     pages: RouteUtils.getTrashRoutes(),
  //     icons: [
  //       AppIcons.home03,
  //       AppIcons.activity,
  //       AppIcons.home01,
  //       AppIcons.file01
  //     ],
  //     routes: [
  //       LocaleKeys.home.tr(context: context),
  //       LocaleKeys.roadMap.tr(context: context),
  //       LocaleKeys.payment.tr(context: context),
  //       LocaleKeys.history.tr(context: context),
  //     ],
  //   );
  // }
  //
  // Future<void> navigateSecondaryMainPage(BuildContext context) async {
  //   return await NavigationUtils.getMainNavigator().navigateMainPage(
  //     pages: RouteUtils.getPartnerRoutes(),
  //     icons: [
  //       AppIcons.home03,
  //       AppIcons.menu02,
  //       AppIcons.coinsRotate,
  //       AppIcons.clockForward,
  //       AppIcons.userProfile02
  //     ],
  //     routes: [
  //       LocaleKeys.home.tr(context: context),
  //       LocaleKeys.menu.tr(context: context),
  //       LocaleKeys.payment.tr(context: context),
  //       LocaleKeys.history.tr(context: context),
  //       LocaleKeys.profile.tr(context: context)
  //     ],
  //   );
  // }
}