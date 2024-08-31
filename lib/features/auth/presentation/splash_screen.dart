import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_sfera/core/assets/app_image.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/features/auth/presentation/choose_language.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), (){
      context.replaceRoute(const ChooseLanguageRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var l10n = context.l10n;

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
                AppImage.logo,
              width: 100,
              height: 100,
            ),
            Text(
                l10n.appName,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      )
    );
  }
}
