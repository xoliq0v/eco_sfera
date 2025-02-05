
import 'package:core/core.dart';
import '../../../design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:navigation/navigation.dart';

class ActiveHistoryBottomSheet {

  static void show(BuildContext context, ActiveHistory order) async {
    final availableMaps = await MapLauncher.installedMaps;
    await context.showCustomBarModalBottomSheet(
      builder: (context) {
        return IntrinsicHeight(
          child: SizedBox(
            height: 270,
            width: double.maxFinite,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  15.verticalSpace,
                  Align(
                    child: Text(
                        '5 daqiqa • 2 km',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  const Divider(color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 20,
                      bottom: 5
                    ),
                      child: Text(LocaleKeys.fromWhere.tr(context: context),style: Theme.of(context).textTheme.headlineMedium,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      bottom: 15
                    ),
                    child: Text(
                        order.user.name ?? '',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: EcoMaterialButton(
                              color: Theme.of(context).colorScheme.surface,
                              onPressed: () async {
                                await availableMaps.first.showMarker(
                                  coords: Coords(double.parse(order.locations[0].latitude),double.parse(order.locations[0].longitude),),
                                  title: "${order.user.name}\n${order.user.phoneNumber?.formatUzbekPhoneNumber()}",
                                );
                              },
                              child: Text(LocaleKeys.location.tr(context: context)),
                            ),
                          ),
                          5.horizontalSpace,
                          Expanded(
                            child: EcoButton(
                                width: double.maxFinite,
                                height: 75,
                                borderRadius: 50,
                                onPressed: (){
                                  NavigationUtils.getMainNavigator().navigateBuyPage(
                                      type: 'from_home',
                                      historyOrder: order
                                  );
                                },
                                child: Text(LocaleKeys.buy.tr(context: context),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PartnerHistoryBottomSheet {

  static void show(BuildContext context, PartnerOrder order) async {
    final availableMaps = await MapLauncher.installedMaps;
    await context.showCustomBarModalBottomSheet(
      builder: (context) {
        return IntrinsicHeight(
          child: SizedBox(
            height: 270,
            width: double.maxFinite,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  15.verticalSpace,
                  Align(
                    child: Text(
                        '5 daqiqa • 2 km',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  const Divider(color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 20,
                      bottom: 5
                    ),
                      child: Text(LocaleKeys.fromWhere.tr(context: context),style: Theme.of(context).textTheme.headlineMedium,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      bottom: 15
                    ),
                    child: Text(
                        order.driver.name ?? '',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          // Expanded(
                          //   child: EcoMaterialButton(
                          //     color: Theme.of(context).colorScheme.surface,
                          //     onPressed: () async {
                          //       // await availableMaps.first.showMarker(
                          //       //   coords: Coords(double.parse(order.locations[0].longitude),double.parse(order.locations[0].latitude),),
                          //       //   title: "${order.user.name}\n${order.user.phoneNumber?.formatUzbekPhoneNumber()}",
                          //       // );

                          //     },
                          //     child: Text(LocaleKeys.location.tr(context: context)),
                          //   ),
                          // ),
                          5.horizontalSpace,
                          Expanded(
                            child: EcoButton(
                                width: double.maxFinite,
                                height: 75,
                                borderRadius: 50,
                                onPressed: (){
                                  NavigationUtils.getMainNavigator().navigateBuyPage(
                                      type: 'from_home',
                                  );
                                },
                                child: Text(LocaleKeys.buy.tr(context: context),style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}