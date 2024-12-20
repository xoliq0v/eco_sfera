
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';


class OrderItem extends StatelessWidget {
  final OrderModel order;
  final bool isNew;
  final Function()? onTap;
  const OrderItem({super.key, required this.order,this.onTap, this.isNew = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
          top: 15,
        ),
        child: SizedBox(
          width: double.maxFinite,
          height: 150,
          child: DecoratedBox(
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1
                  )
                ],
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(25)
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
                                      order.orderUser.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        color: isNew ? AppColors.main : context.colorScheme.primary
                                      ),
                                    ),
                                    Flexible(
                                        child: Text(
                                          order.orderUser.phoneNumber.formatUzbekPhoneNumber(),
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.headlineMedium,
                                        )
                                    )
                                  ],
                                ),
                              )
                          ),
                          SvgPicture.asset(AppIcons.delivery,color: Theme.of(context).colorScheme.primary,),
                          10.horizontalSpace
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
                      Text('${order.date.hour}:${order.date.minute}',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: isNew ? AppColors.main : context.colorScheme.primary),),
                      Text(order.distance!.toInt().toString().toKm(context),style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: isNew ? AppColors.main : context.colorScheme.primary),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
