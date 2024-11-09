import 'package:core/core.dart';
import 'package:core/generated/locale_keys.g.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RoadCard extends StatelessWidget {
  const RoadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(left: 25,right: 25,top: 10),
        width: double.maxFinite,
        height: 155,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  15.verticalSpace,
                  Image.asset(AppIcons.frameBlue,width: 40,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3,bottom: 3),
                      child: Dash(
                        direction: Axis.vertical,
                        length: 37,
                        dashColor: Colors.grey,
                      ),
                    ),
                  ),
                  Image.asset(AppIcons.frameGreen,width: 40,),
                  15.verticalSpace,
                ],
              ),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.verticalSpace,
                  Text(LocaleKeys.routeNumber.tr(context: context),style: Theme.of(context).textTheme.headlineMedium,),
                  Text('21 - 22',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15
                  ),),
                  // const Dash( dashColor: Colors.grey, dashGap: 0,),
                  Spacer(),
                  Text(LocaleKeys.routeName.tr(context: context),style: Theme.of(context).textTheme.headlineMedium,),
                  Text('Ittifoq mahallasi',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15
                  ),),
                  15.verticalSpace,
                ],
              ),
              15.horizontalSpace,
              SizedBox(
                width: 45,
                height: 45,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Icon(Icons.location_on_outlined),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
