import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LogOutDialog{

  static Future<bool?> showLogoutDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(LocaleKeys.logout.tr(context: context)),
          content: Text(LocaleKeys.logoutContent.tr(context: context)),
          actions: [
            TextButton(
              onPressed: () {
                context.router.pop(false);
              },
              child: Text(LocaleKeys.cancel.tr(context: context)),
            ),
            TextButton(
              onPressed: () {
                context.router.pop(true);
              },
              child: Text(LocaleKeys.logout.tr(context: context)),
            ),
          ],
        );
      },
    );
  }
}

