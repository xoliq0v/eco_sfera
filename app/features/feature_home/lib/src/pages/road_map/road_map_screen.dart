
import 'package:core/core.dart' ;
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:flutter/material.dart';

import '../../constants/app_image.dart';

@RoutePage()
class RoadMapScreen extends StatefulWidget {
  const RoadMapScreen({super.key});

  @override
  State<RoadMapScreen> createState() => _RoadMapScreenState();
}

class _RoadMapScreenState extends State<RoadMapScreen> {
  late Map<String,String> list;

  @override
  Widget build(BuildContext context) {

    list = {
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
          SliverToBoxAdapter(
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
                        SvgPicture.asset(AppImage.frameBlue,width: 40,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3,bottom: 3),
                            // child: Dash(
                            //   direction: Axis.vertical,
                            //   length: 37,
                            //   dashColor: Colors.grey,
                            // ),
                          ),
                        ),
                        SvgPicture.asset(AppImage.frameGreen,width: 40,),
                        15.verticalSpace,
                      ],
                    ),
                    15.horizontalSpace,
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
                        const Expanded(child: SizedBox.shrink()),
                        // const Dash( dashColor: Colors.grey, dashGap: 0,),
                        const Expanded(child: SizedBox.shrink()),
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
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Icon(Icons.location_on_outlined),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 25
              ),
              child: EcoButton(
                onPressed: (){
                  // context.router.navigate(const OrderCardRoute());
                },
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                height: 65,
                borderRadius: 20,
                child: Text(LocaleKeys.orderCard.tr(context: context),style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.main),),
              ),
            ),
          ),
          SliverToBoxAdapter(child: 30.verticalSpace,),
          SliverList.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final key = list.keys.elementAt(index);
              final value = list.values.elementAt(index);
              return Container(
                padding: EdgeInsets.only(top: index == 0 ? 10 : 0,bottom: list.length-1 == index ? 30 : 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: index == 0 ? const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ) : BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(key, style: Theme.of(context).textTheme.bodyLarge)),
                      Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.end)),
                    ],
                  ),
                ),
              );
              // return Container(
              //     decoration: BoxDecoration(
              //       color: Theme.of(context).scaffoldBackgroundColor,
              //       borderRadius: index == 0 ? const BorderRadius.only(
              //         topRight: Radius.circular(50),
              //         topLeft: Radius.circular(50),
              //       ) : BorderRadius.circular(0),
              //     ),
              //     child: Row(
              //       children: [
              //         Text(list[index].)
              //       ],
              //     )// Your list item content here
              // );
            },
            // Don't forget to specify itemCount if you know the number of items
            // itemCount: yourItemCount,
          )
        ],
      ),
    );
  }
}
