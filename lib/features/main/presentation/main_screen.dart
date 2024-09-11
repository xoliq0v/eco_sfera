import 'package:eco_sfera/core/assets/app_icons.dart';
import 'package:eco_sfera/core/assets/app_image.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/features/main/presentation/widget/eco_service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/buttons/eco_button.dart';

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[0].image,
                        title: items[0].title,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[1].image,
                        title: items[1].title,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[2].image,
                        title: items[2].title,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[3].image,
                        title: items[3].title,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2.4,
                      child: EcoServiceItem(
                        image: items[4].image,
                        title: items[4].title,
                        itemType: items[4].itemType,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[5].image,
                        title: items[5].title,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[6].image,
                        title: items[6].title,
                        onClick: () {},
                      ),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.2,
                      child: EcoServiceItem(
                        image: items[7].image,
                        title: items[7].title,
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
                    onPressed: () {},
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
                    onPressed: () {},
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
}

class GridItem {
  final String title;
  final String image;
  final ItemType itemType;

  const GridItem({
    required this.title,
    required this.image,
    this.itemType = ItemType.medium,
  });
}

class GridTile extends StatelessWidget {
  final int columnSpan;
  final int rowSpan;
  final Widget child;

  const GridTile({
    Key? key,
    required this.columnSpan,
    required this.rowSpan,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * columnSpan + (columnSpan - 1) * 10;
        final height = constraints.maxHeight * rowSpan + (rowSpan - 1) * 10;
        return SizedBox(
          width: width,
          height: height,
          child: child,
        );
      },
    );
  }
}