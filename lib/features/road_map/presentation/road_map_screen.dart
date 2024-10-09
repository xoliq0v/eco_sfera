import 'package:eco_sfera/core/assets/app_image.dart';
import 'package:eco_sfera/core/assets/l10n/app_localizations.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

@RoutePage()
class RoadMapScreen extends StatefulWidget {
  const RoadMapScreen({super.key});

  @override
  State<RoadMapScreen> createState() => _RoadMapScreenState();
}

class _RoadMapScreenState extends State<RoadMapScreen> {

  late AppLocalizations l10n;

  late Map<String,String> list;

  @override
  Widget build(BuildContext context) {

    l10n = context.l10n;

    list = {
      l10n.pageNumber: "002243",
      l10n.workOrder: "01.06.2024",
      l10n.carNumber: "8:00-17:00",
      l10n.car: "ISUZU musravoz",
      l10n.driver: "Qurbonov O’ktam",
      l10n.combinedRoute: "21-22marshrut",
      l10n.departure: "8:00",
      l10n.returnN: "17:00",
      l10n.totalDistance: "106Km",
      l10n.speedometerStart: "156 009",
      l10n.speedometerEnd: "153 115",
      l10n.actualTime: "8:10",
      l10n.plannedTime: "19:10"
    };

    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        title: Text(l10n.roadMap),
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
                        Gap(15),
                        SvgPicture.asset(AppImage.frameBlue,width: 40,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3,bottom: 3),
                            child: Dash(
                              direction: Axis.vertical,
                              length: 37,
                              dashColor: Colors.grey,
                              // thickness: 1,
                              // color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ),
                        SvgPicture.asset(AppImage.frameGreen,width: 40,),
                        Gap(15),
                      ],
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(15),
                        Text(l10n.routeNumber,style: Theme.of(context).textTheme.headlineMedium,),
                        Text('21 - 22',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          // color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15
                        ),),
                        const Expanded(child: SizedBox.shrink()),
                        const Dash( dashColor: Colors.grey, dashGap: 0,),
                        const Expanded(child: SizedBox.shrink()),
                        Text(l10n.routeName,style: Theme.of(context).textTheme.headlineMedium,),
                        Text('Ittifoq mahallasi',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            // color: Theme.of(context).scaffoldBackgroundColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15
                        ),),
                        Gap(15),
                      ],
                    ),
                    const Gap(7),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Icon(Icons.location_on_outlined),
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
                  context.router.navigate(const OrderCardRoute());
                },
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                height: 65,
                borderRadius: 20,
                child: Text(l10n.orderCard,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.main),),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Gap(30),),
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
