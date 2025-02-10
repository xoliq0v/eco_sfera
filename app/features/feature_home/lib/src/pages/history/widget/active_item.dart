
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../../di/init_route.dart';


class ActiveItem extends StatelessWidget {
  final ActiveHistory history;
  final bool isNew;
  final Function()? onTap;
  const ActiveItem({super.key, required this.history,this.onTap, this.isNew = false});

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
                                    history.user.name ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: isNew ? AppColors.main : context.colorScheme.primary
                                    ),
                                  ),
                                  Flexible(
                                      child: Text(
                                        history.user.phoneNumber?.formatUzbekPhoneNumber() ?? '',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${DateFormat('dd.MM.yyyy HH:mm').parse(history.date!).customFormat('HH:mm')}',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: isNew ? AppColors.main : context.colorScheme.primary),),
                    // Text(history.id.toString(),style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: isNew ? AppColors.main : context.colorScheme.primary),),
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
