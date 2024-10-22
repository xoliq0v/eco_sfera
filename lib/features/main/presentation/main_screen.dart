import 'package:eco_sfera/core/assets/app_icons.dart';
import 'package:eco_sfera/core/assets/app_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_sfera/core/assets/l10n/app_localizations.dart';
import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/features/main/presentation/widget/eco_service_item.dart';
import 'package:eco_sfera/features/main/presentation/widget/grid_item.dart';
import 'package:eco_sfera/features/navigation/data/model/navigation_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/buttons/eco_button.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  MainScreen({super.key});



  final List<GridItem> items = [
    const GridItem(title: 'Buyurtmalar', image: AppImage.orders),
    const GridItem(title: 'Sotib olish', image: AppImage.buying),
    const GridItem(title: 'Tarix', image: AppImage.history),
    const GridItem(title: 'Hamkorlar', image: AppImage.partners),
    const GridItem(title: "Yo'l varaqasi", image: AppImage.roadMap, itemType: ItemType.large),
    const GridItem(title: 'Hisobotlar', image: AppImage.report),
    const GridItem(title: 'Poligon', image: AppImage.polygon,itemType: ItemType.small),
    const GridItem(title: 'Profil', image: AppImage.profile,itemType: ItemType.small),
  ];

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Gap(10),
            Expanded(
              child: Padding(
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
                        image: items[0].image,
                        title: l10n.orders,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[1].image,
                        title: l10n.buy,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[2].image,
                        title: l10n.history,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[3].image,
                        title: l10n.partners,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2.4,
                      child: EcoServiceItem(
                        image: items[4].image,
                        title: l10n.roadMap,
                        itemType: items[4].itemType,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[5].image,
                        title: l10n.reports,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[6].image,
                        title: l10n.polygon,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[7].image,
                        title: l10n.profile,
                        onClick: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  EcoButton(
                    onPressed: () { context.router.navigate(NavigationRoute(params: firstParam(l10n)),); },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.trash02),
                        const Gap(5),
                        Text(l10n.waste)
                      ],
                    ),
                    // icon: Icons.delete_outline,
                  ),
                  const SizedBox(height: 8),
                  EcoButton(
                    onPressed: () { context.router.navigate(NavigationRoute(
                      params: secondParam(l10n)
                    )); },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.iconParkRecycling),
                        const Gap(5),
                        Text(l10n.secondary)
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

  NavigationParams firstParam(AppLocalizations l10n){
    return NavigationParams(
        svg: [
          AppIcons.home03,
          AppIcons.activity,
          AppIcons.home01,
          AppIcons.file01
        ],
        labels: [
          l10n.home,
          l10n.roadMap,
          l10n.polygon,
          l10n.reports
        ],
        page: const[
          HomeRoute(),
          RoadMapRoute(),
          PolygonRoute(),
          ReportRoute()
        ]
    );
  }

  NavigationParams secondParam(AppLocalizations l10n){
    return NavigationParams(
        svg: [
          AppIcons.home03,
          AppIcons.menu02,
          AppIcons.coinsRotate,
          AppIcons.clockForward,
          AppIcons.userProfile02
        ],
        labels: [
          l10n.home,
          l10n.menu,
          l10n.payment,
          l10n.history,
          l10n.profile
        ],
        page: <PageRouteInfo<dynamic>>[
          const HomeRoute(),
          OrdersRoute(),
          const BuyRoute(),
          const AdmissionsHistoryRoute(),
        ]
    );
  }

}


