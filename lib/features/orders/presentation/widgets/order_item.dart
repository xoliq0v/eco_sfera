import 'dart:developer';

import 'package:eco_sfera/core/assets/app_icons.dart';
import 'package:eco_sfera/core/widgets/dialogs/order_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../data/models/order.dart';


class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OrderBottomSheet.show(context,order.fromLocation);
        log('\$TAB');
      },
      child: Container(
        width: double.maxFinite,
        height: 140,
        margin: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 15,
        ),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                25
            )
        ),
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 5,
                                left: 5,
                                top: 15
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20
                                  ),
                                ),
                                Text(
                                  order.description,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                )
                              ],
                            ),
                          )
                      ),
                      SvgPicture.asset(AppIcons.delivery),
                      const Gap(10)
                    ],
                  ),
                )
            ),
            const Divider(color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 10,
                  bottom: 10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(order.date,style: Theme.of(context).textTheme.headlineMedium,),
                  Text(order.distance,style: Theme.of(context).textTheme.headlineMedium,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
