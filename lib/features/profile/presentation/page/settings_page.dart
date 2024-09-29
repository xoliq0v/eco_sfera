import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/utils/bloc/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  ValueNotifier<bool> nightMode = ValueNotifier(false);
  ValueNotifier<bool> notifications = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    nightMode.value = Theme.of(context).brightness == Brightness.dark ? true : false;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.settings),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.nightMode),
                ValueListenableBuilder(
                  valueListenable: nightMode,
                  builder: (context,p2,p3) {
                    return CupertinoSwitch(
                        value: nightMode.value,
                        onChanged: (value){
                          nightMode.value = value;
                          context.read<ThemeCubit>().setThemeMode(value == true ? ThemeMode.dark : ThemeMode.light);
                        }
                    );
                  }
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.notifications),
                ValueListenableBuilder(
                    valueListenable: notifications,
                    builder: (context,p2,p3) {
                      return CupertinoSwitch(
                          value: notifications.value,
                          onChanged: (value){
                            notifications.value = value;
                          }
                      );
                    }
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
