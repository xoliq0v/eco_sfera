import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../core/assets/app_icons.dart';

@RoutePage()
class MapRoutePage extends StatefulWidget {
  const MapRoutePage({super.key});

  @override
  State<MapRoutePage> createState() => _MapRoutePageState();
}

class _MapRoutePageState extends State<MapRoutePage> {

  late YandexMapController yandexMapController;

  @override
  void dispose() {
    yandexMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            nightModeEnabled: Theme.of(context).brightness == Brightness.dark ? true : false,
              tiltGesturesEnabled: false,
              zoomGesturesEnabled: false,
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
            onMapCreated: (YandexMapController yandexMapController){
              this.yandexMapController = yandexMapController;
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: const EdgeInsets.only(bottom: 50,left: 15,right: 15),
              width: double.maxFinite,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: LinearProgressIndicator(
                      value: 0.2,
                      color: Theme.of(context).colorScheme.surface,
                      backgroundColor: AppColors.main,
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.2),
                  //     padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  //     // decoration: BoxDecoration(
                  //     //   color: Colors.red
                  //     // ),
                  //     child: SvgPicture.asset(AppIcons.route,color: Theme.of(context).colorScheme.primary,),
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
