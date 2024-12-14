import 'package:core/core.dart';
import 'package:core/generated/locale_keys.g.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:map_service/map_service.dart';
import 'package:navigation/navigation.dart';

class OrderSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.85),
      builder: (context) => const _OrderSheetContent(),
    );
  }
}

class _OrderSheetContent extends StatelessWidget {
  const _OrderSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          _SheetBody(),
        ],
      ),
    );
  }
}

class _SheetBody extends StatelessWidget {

  openMapsSheet(context) async {
    try {
      final coords = Coords(37.759392, -122.5107336);
      final title = "Ocean Beach";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () => map.showMarker(
                            coords: coords,
                            title: title,
                          ),
                          title: Text(map.mapName),
                          leading: SvgPicture.asset(
                            map.icon,
                            height: 30.0,
                            width: 30.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: double.maxFinite,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 30,
                  bottom: 10
                ),
                child: EcoMaterialButton(onPressed: () async{
                  openMapsSheet(context);
                }, child: Text(LocaleKeys.address.tr(context: context))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  bottom: 60
                ),
                child: EcoMaterialButton(onPressed: () async{
                  await NavigationUtils.getMainNavigator().navigateBuyPage();
                }, child: Text(LocaleKeys.buy.tr(context: context))),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class _MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: MapWidget(),
        ),
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  final String title;
  final String value;

  const _ItemRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,),
          Text(value),
        ],
      ),
    );
  }
}