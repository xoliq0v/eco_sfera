import 'package:core/core.dart';
import 'package:core/generated/locale_keys.g.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:map_service/map_service.dart';
import 'package:navigation/navigation.dart';

class OrderSheet {
  static void show(BuildContext context,Coords coords,Map<String,String> user,Map<String,int> params) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.85),
      builder: (context) => _OrderSheetContent(coords: coords,user: user,params: params,),
    );
  }
}

class _OrderSheetContent extends StatelessWidget {
  final Coords coords;
  final Map<String,String> user;
  final Map<String,int> params;
  const _OrderSheetContent({super.key,required this.coords,required this.user,required this.params});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          _SheetBody(coords: coords,user: user,params: params,),
        ],
      ),
    );
  }
}

class _SheetBody extends StatelessWidget {
  _SheetBody({required this.coords,required this.user,required this.params});
  late Coords coords;

  final Map<String,String> user;
  final Map<String,int> params;

  openMapsSheet(context) async {
    try {
      final title = LocaleKeys.orderAddress.tr(context: context,args: [user.keys.first,user.values.first]);
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
                  await NavigationUtils.getMainNavigator().navigateBuyPage(params);
                }, child: Text(LocaleKeys.buy.tr(context: context))),
              ),
            ],
          ),
        ),
      ),
    );
  }

}