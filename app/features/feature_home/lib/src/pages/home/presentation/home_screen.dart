import 'dart:io';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {

  late YandexMapController yandexMapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    yandexMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () => {
              SwitchBottomSheet.show(context)
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                AppIcons.userProfile02,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.totalBalance.tr(context: context), style: Theme.of(context).textTheme.headlineMedium),
            Text(
              '100 000sum',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),
            )
          ],
        ),
      ),
      body: MapWidget(
        // scrollGesturesEnabled: false,
        // rotateGesturesEnabled: false,
        // tiltGesturesEnabled: false,
        // zoomGesturesEnabled: false,
        onControllerCreated: (controller) {
          yandexMapController = controller;
        }, mapObjects: [],
      ),
    );
  }
}