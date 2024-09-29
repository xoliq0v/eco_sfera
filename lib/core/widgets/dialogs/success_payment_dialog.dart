import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessPaymentDialog {
  static void show(
      BuildContext context,) {
    showDialog(
      barrierDismissible: true,
      barrierColor: Theme.of(context).colorScheme.surface.withOpacity(0.85),
      context: context,
      builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).scaffoldBackgroundColor
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                        Icons.check_circle,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 130,
                    ),
                    const Gap(20),
                    Text(
                        context.l10n.thePaymentWasSuccessful,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
      },
    );
  }
}