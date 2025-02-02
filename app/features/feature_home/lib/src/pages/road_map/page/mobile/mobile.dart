part of '../../road_map_screen.dart';

class _Mobile extends StatefulWidget {
  const _Mobile();

  @override
  State<_Mobile> createState() => Mobile();
}

class Mobile extends State<_Mobile> {
  late final Map<String, String> routeDetails;

  @override
  void initState() {
    super.initState();
    routeDetails = {
      LocaleKeys.pageNumber: "002243",
      LocaleKeys.workOrder: "01.06.2024",
      LocaleKeys.carNumber: "8:00-17:00",
      LocaleKeys.car: "ISUZU musravoz",
      LocaleKeys.driver: "Qurbonov O'ktam",
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
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: routeDetails.length,
                  itemBuilder: (context, index) {
                    final key = routeDetails.keys.elementAt(index);
                    final value = routeDetails.values.elementAt(index);
                    return RouteDetailTile(
                      keyText: key,
                      valueText: value,
                      isFirst: index == 0,
                      isLast: index == routeDetails.length - 1,
                    );
                  },
                ),
              ),
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