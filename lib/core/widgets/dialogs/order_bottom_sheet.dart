import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderBottomSheet {
  static void show(BuildContext context, String fromWhere) {
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
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(250),
                ),
              ),
              const Gap(10),
              Container(
                height: 270,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(15),
                    Align(
                      child: Text(
                          '5 daqiqa • 2 km',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const Gap(15),
                    const Divider(color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                        bottom: 5
                      ),
                        child: Text(l10n.fromWhere,style: Theme.of(context).textTheme.headlineMedium,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        bottom: 15
                      ),
                      child: Text(
                          fromWhere,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 15,
                          left: 15,
                          bottom: 10,
                          top: 20
                        ),
                        child: EcoButton(
                            width: double.maxFinite,
                            height: 60,
                            borderRadius: 30,
                            onPressed: (){},
                            child: Text(l10n.acceptance)
                        ),
                      ),
                    )
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