import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

class PartnerWidget extends StatelessWidget {
  final PartnerItem partner;
  final Function()? onTap;
  const PartnerWidget({super.key, required this.partner, this.onTap});

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
              color: Theme.of(context).colorScheme.surface,
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
                                    partner.nickName,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      color: false ? AppColors.main : context.colorScheme.primary
                                    ),
                                  ),
                                  Flexible(
                                      child: Text(
                                        partner.comment,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.headlineMedium,
                                      )
                                  )
                                ],
                              ),
                            )
                        ),
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
                    Text(partner.status ?? false ? LocaleKeys.acceptable.tr(context: context) : LocaleKeys.closed.tr(context: context)),
                    // Text('${history.id}:${history.id}',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: isNew ? AppColors.main : context.colorScheme.primary),),
                    Text(partner.distance?.toKm(context)??'0km',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: false ? AppColors.main : context.colorScheme.primary),),
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
