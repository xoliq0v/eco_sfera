import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Theme.of(context).colorScheme.surface.withOpacity(0.85),
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (didPop) return;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: CircularProgressIndicator.adaptive(),
                )
            ],
          ),
        );
      },
    );
  }
}