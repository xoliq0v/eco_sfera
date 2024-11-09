
part of '../../road_map_screen.dart';

class _Tablet extends StatefulWidget {
  const _Tablet({super.key});

  @override
  State<_Tablet> createState() => Tablet();
}

class Tablet extends State<_Tablet> {
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
    return Material(
      color: AppColors.main,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 200,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor
                  ),
              ),
            ),
            Positioned(
                top: AppScreen.statusBarHeight + 40,
                left: 50,
                child: Text(LocaleKeys.roadMap.tr(context: context),style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 30
                  ),)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100, top: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(-2, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppIcons.frameBlue, width: 40),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 3, bottom: 3),
                                          child: Dash(
                                            direction: Axis.horizontal,
                                            dashColor: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Image.asset(AppIcons.frameGreen, width: 40),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            LocaleKeys.routeNumber.tr(context: context),
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                          Text(
                                            '21 - 22',
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            LocaleKeys.routeName.tr(context: context),
                                            style: Theme.of(context).textTheme.headlineMedium,
                                          ),
                                          Text(
                                            'Ittifoq mahallasi',
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: SizedBox(
                                width: 45,
                                height: 45,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Icon(Icons.location_on_outlined),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100, top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            width: 400,
                            height: 600,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child: ListView.builder(
                                itemCount: routeDetails.length,
                                itemBuilder: (context, index) {
                                  final key = routeDetails.keys.elementAt(index);
                                  final value = routeDetails.values.elementAt(index);
                                  return RouteDetailTile(
                                    keyText: key,
                                    valueText: value,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
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
                        )
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> navigateOrderCardPage() async {
    return await NavigationUtils.getMainNavigator().navigateOrderCardPage();
  }
}
