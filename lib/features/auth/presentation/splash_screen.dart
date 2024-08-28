import 'package:auto_route/annotations.dart';
import 'package:eco_sfera/core/assets/app_image.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    var l10n = context.l10n;

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImage.logo),
            Text(
                l10n.appName,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.blackWash
              ),
            )
          ],
        ),
      )
    );
  }
}
