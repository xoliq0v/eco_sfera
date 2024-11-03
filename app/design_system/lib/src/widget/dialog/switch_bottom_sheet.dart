import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../design_system.dart';

class SwitchBottomSheet{

  static void show(BuildContext context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.85),
      builder: (context) {
        return IntrinsicHeight(
          child: Column(
            children: [
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(250),
                ),
              ),
              10.verticalSpace,
              Container(
                padding: const EdgeInsets.only(
                  bottom: 50,
                  top: 20,
                  right: 25,
                  left: 25
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.trash02),
                        5.verticalSpace,
                        Text(LocaleKeys.waste.tr(context: context))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider( color: Theme.of(context).colorScheme.primary ),
                    ),
                    // Dash(length: 400, dashGap: 0,dashColor: Theme.of(context).colorScheme.primary,),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.iconParkRecycling),
                        5.verticalSpace,
                        Text(LocaleKeys.secondary.tr(context: context))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

}