import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/assets/app_icons.dart';
import '../../../core/assets/theme/app_colors.dart';
import '../../../core/constants/route/app_router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              context.router.push(const ProfileRoute());
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(AppIcons.userProfile02,color: Theme.of(context).colorScheme.primary,),
            ),
          )
        ],
        leading: null,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.totalBalance,style: Theme.of(context).textTheme.headlineMedium,),
            Text('100 000sum',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),)
          ],
        ),
      ),
      body: YandexMap(
        nightModeEnabled: Theme.of(context).brightness == Brightness.dark ? true : false,
      ),
    );
  }
}