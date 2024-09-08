import 'package:auto_route/auto_route.dart';
import 'package:eco_sfera/core/assets/app_icons.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/route/app_router.gr.dart';

import '../../../core/utils/bloc/locale_cubit.dart';

@RoutePage()
class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.globe03,
                      color: AppColors.main,
                      width: 100,
                      height: 100,
                    ),
                    const Gap(20),
                    Text(l10n.chooseLang,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 20
                    ),),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: EcoButton(onPressed: (){
                        context.navigateTo(const BoardingRoute());
                        context.read<LocaleCubit>().changeLocale('uz');
                      }, text: 'Uz',),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: EcoButton(onPressed: (){
                        context.navigateTo(const BoardingRoute());
                        context.read<LocaleCubit>().changeLocale('ru');
                      }, text: 'Ру'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: EcoButton(onPressed: (){
                        context.navigateTo(const BoardingRoute());
                        context.read<LocaleCubit>().changeLocale('en');
                      }, text: 'En',),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
