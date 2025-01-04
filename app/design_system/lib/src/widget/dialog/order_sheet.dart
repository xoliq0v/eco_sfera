import 'package:core/core.dart';
import 'package:core/generated/locale_keys.g.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:map_service/map_service.dart';
import 'package:model/model.dart';
import 'package:navigation/navigation.dart';

import '../expandble_text.dart';

class OrderSheet {
  static void show(BuildContext context,Coords coords,Map<String,String> user,OrderModel params) {
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
  final OrderModel params;
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
  final OrderModel params;

  void openMapsSheet(BuildContext context) async {
    try {
      final title = LocaleKeys.orderAddress.tr(context: context,args: [user.keys.first,user.values.first]);
      final availableMaps = await MapLauncher.installedMaps;

      return showModalBottomSheet(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                5.verticalSpace,
                Text('2 km · 6 daq',style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 35
                ),),
                5.verticalSpace,
                Text(
                  'Roderick Usher  +998 71 234 56 78',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                30.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Box(icon: AppIcons.box,title: LocaleKeys.payment.tr(context: context),value: 'Qog’oz'),
                    _Box(icon: AppIcons.weight,title: LocaleKeys.payment.tr(context: context),value: '15 kg'),
                  ],
                ),

                35.verticalSpace,

                ExpandableText(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget'),

                30.verticalSpace,

                Row(
                  children: [
                    Expanded(
                      child: EcoMaterialButton(color: context.colorScheme.surface, onPressed: () async{
                        await context.router.pop();
                      }, child: Text(LocaleKeys.cancel.tr(context: context))),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: EcoMaterialButton(onPressed: () async{
                        // openMapsSheet(context);
                        await NavigationUtils.getMainNavigator().navigateBuyPage(params);
                      }, child: Text(LocaleKeys.buy.tr(context: context))),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}

class _Box extends StatelessWidget {
  final String icon;
  final String title;
  final String value;
  const _Box({super.key,required this.icon,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon,height: 30,width: 30,),
        5.horizontalSpace,
        Column(
          children: [
            Text(title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),),
            2.verticalSpace,
            Text(value,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: context.colorScheme.primary
            ),),
          ],
        )
      ],
    );
  }
}


