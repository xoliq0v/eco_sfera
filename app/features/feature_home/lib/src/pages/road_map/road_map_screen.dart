import 'package:core/core.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:feature_home/src/pages/road_map/widget/road_card.dart';
import 'package:feature_home/src/pages/road_map/widget/route_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class RoadMapScreen extends StatefulWidget {
  const RoadMapScreen({super.key});

  @override
  State<RoadMapScreen> createState() => _RoadMapScreenState();
}

class _RoadMapScreenState extends State<RoadMapScreen> {
  late final Map<String, String> routeDetails;

  @override
  void initState() {
    super.initState();
    routeDetails = {
      LocaleKeys.pageNumber: "002243",
      LocaleKeys.workOrder: "01.06.2024",
      LocaleKeys.carNumber: "8:00-17:00",
      LocaleKeys.car: "ISUZU musravoz",
      LocaleKeys.driver: "Qurbonov O’ktam",
      LocaleKeys.combinedRoute: "21-22marshrut",
      LocaleKeys.departure: "8:00",
      LocaleKeys.returnN: "17:00",
      LocaleKeys.totalDistance: "106Km",
      LocaleKeys.speedometerStart: "156 009",
      LocaleKeys.speedometerEnd: "153 115",
      LocaleKeys.actualTime: "8:10",
      LocaleKeys.plannedTime: "19:10"
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(LocaleKeys.roadMap.tr(context: context)),
        backgroundColor: AppColors.main,
        surfaceTintColor: AppColors.main,
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          const RoadCard(),
          30.verticalSpace.toBoxAdapter(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: EcoButton(
                onPressed: () {
                  navigateOrderCardPage();
                },
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                height: 65,
                borderRadius: 20,
                child: Text(
                  LocaleKeys.orderCard.tr(context: context),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.main),
                ),
              ),
            ),
          ),
          30.verticalSpace.toBoxAdapter(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final key = routeDetails.keys.elementAt(index);
                final value = routeDetails.values.elementAt(index);
                return RouteDetailTile(
                  keyText: key,
                  valueText: value,
                  isFirst: index == 0,
                  isLast: index == routeDetails.length - 1,
                );
              },
              childCount: routeDetails.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> navigateOrderCardPage() async {
    return await NavigationUtils.getMainNavigator().navigateOrderCardPage();
  }
}
