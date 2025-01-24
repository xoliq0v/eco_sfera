import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

class OrderItem extends StatelessWidget {
  final OrderModel? order;
  final PartnerOrder? partnerOrder;
  final bool isNew;
  final Function()? onTap;

  const OrderItem({
    super.key,
    this.order,
    this.partnerOrder,
    required this.isNew,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                                    order?.orderUser.name??partnerOrder?.driver.name??'',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: isNew ? AppColors.main : context.colorScheme.primary
                                    ),
                                  ),
                                  Flexible(
                                      child: Text(
                                        order?.orderUser.phoneNumber.formatUzbekPhoneNumber()??partnerOrder!.driver.phoneNumber?.formatUzbekPhoneNumber()??'',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.headlineMedium,
                                      )
                                  )
                                ],
                              ),
                            )
                        ),
                        SvgPicture.asset(
                          AppIcons.delivery,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 10)
                      ],
                    ),
                  )
              ),
              const Divider(color: Colors.grey),
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
                    Text(
                      '${order?.date.hour}:${order?.date.minute}'.formatTime(),
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: isNew ? AppColors.main : context.colorScheme.primary
                      ),
                    ),
                    Text(
                      order?.distance?.toInt().toString().toKm(context)??'0',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: isNew ? AppColors.main : context.colorScheme.primary
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}