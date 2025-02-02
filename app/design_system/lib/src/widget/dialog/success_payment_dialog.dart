import 'package:core/core.dart';
import '../../../design_system.dart';
import 'package:flutter/material.dart';

class SuccessPaymentDialog {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      barrierColor: Theme.of(context).colorScheme.surface.withOpacity(0.85),
      context: context,
      builder: (BuildContext context) {
        // Use MediaQuery to make the dialog responsive
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
        final dialogWidth = isTablet ? 500.0 : 350.0;
        final dialogHeight = isTablet ? 400.0 : 300.0;

        return Center(
          child: SizedBox(
            width: dialogWidth,
            height: dialogHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.secondary,
                    size: isTablet ? 160 : 130, // Adjust icon size for tablet
                  ),
                  SizedBox(height: 20), // Space between icon and text
                  Text(
                    LocaleKeys.thePaymentWasSuccessful.tr(context: context),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: isTablet ? 22 : 18, // Adjust text size for tablet
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}