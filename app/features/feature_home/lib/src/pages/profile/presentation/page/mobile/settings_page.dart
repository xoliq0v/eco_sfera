import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

part 'partner_edit.dart';

@RoutePage()
class SettingsPage extends StatefulWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TypeBloc>(
          create: (context) => AppBlocHelper.getTypeBloc(),
        ),
        BlocProvider<EditPartnerInfoCubit>(
          create: (context) => AppBlocHelper.getEditPartnerInfoCubit(),
        )
      ],
      child: this,
    );
  }
}

class _SettingsPageState extends State<SettingsPage> {

  ValueNotifier<bool> nightMode = ValueNotifier(false);
  ValueNotifier<bool> notifications = ValueNotifier(false);


  @override
  void initState() {
    super.initState();
    context.read<TypeBloc>().get();
  }

  @override
  Widget build(BuildContext context) {
    nightMode.value = Theme.of(context).brightness == Brightness.dark ? true : false;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.settings.tr(context: context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.nightMode.tr(context: context)),
                ValueListenableBuilder(
                  valueListenable: nightMode,
                  builder: (context,p2,p3) {
                    return CupertinoSwitch(
                        value: nightMode.value,
                        onChanged: (value){
                          nightMode.value = value;
                          context.read<ThemeChangerCubit>().toggleTheme();
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
                Text(LocaleKeys.notifications.tr(context: context)),
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
          ),
          BlocBuilder<TypeBloc,AuthTypeState>(
            builder: (context,state) {
              if(state is PartnerType){
                return _PartnerEdit();
              }
              return const SizedBox.shrink();
            }
          )
        ],
        ),
      )
    );
  }
}
