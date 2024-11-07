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
              SizedBox(
                width: 60,
                height: 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    top: 20,
                    right: 25,
                    left: 25
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.trash02,color: Theme.of(context).primaryColor,),
                          5.horizontalSpace,
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
                          SvgPicture.asset(AppIcons.iconParkRecycling,color: Theme.of(context).primaryColor,),
                          5.horizontalSpace,
                          Text(LocaleKeys.secondary.tr(context: context))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

}