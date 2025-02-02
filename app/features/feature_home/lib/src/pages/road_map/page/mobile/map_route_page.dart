import 'package:design_system/design_system.dart';
import '../../widget/custom_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';


@RoutePage()
class MapRoutePage extends StatefulWidget {
  const MapRoutePage({super.key});

  @override
  State<MapRoutePage> createState() => _MapRoutePageState();
}

class _MapRoutePageState extends State<MapRoutePage> {

  late YandexMapController mapController;



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          YandexMap(
            nightModeEnabled: Theme.of(context).brightness == Brightness.dark ? true : false,
              tiltGesturesEnabled: false,
              zoomGesturesEnabled: false,
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
            onMapCreated: (YandexMapController controller){
              mapController = controller;
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50,left: 15,right: 15),
              child: SizedBox(
                width: double.maxFinite,
                height: 70,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomProgressBar(
                        backgroundColor: AppColors.main,
                          progressColor: Colors.grey,
                          iconColor: context.colorScheme.primary,
                          progress: 0.2,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
