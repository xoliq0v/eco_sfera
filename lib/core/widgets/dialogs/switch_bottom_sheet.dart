import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../assets/app_icons.dart';

class SwitchBottomSheet{

  static void show(BuildContext context){

    var l10n = context.l10n;
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
              const Gap(10),
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
                        const Gap(5),
                        Text(l10n.waste)
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
                        const Gap(5),
                        Text(l10n.secondary)
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