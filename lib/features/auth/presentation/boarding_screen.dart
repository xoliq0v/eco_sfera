import 'package:auto_route/auto_route.dart';
import 'package:eco_sfera/core/assets/app_image.dart';
import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/assets/custom_painter.dart';

@RoutePage()
class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppImage.boarding,),
          ),
          Positioned(
            bottom: 0,
            top: MediaQuery.of(context).size.height / 2.2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, (MediaQuery.of(context).size.height / 1.7).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(context),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.appNameM,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,right: 20,left: 20),
                          child: Text(
                              l10n.boardingDescription,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(

                            ),
                          ),
                        ),
                        const Gap(40),
                        Padding(
                            padding: const EdgeInsets.only(left: 30,right: 35),
                          child: EcoButton(onPressed: (){
                            context.navigateTo(const AuthRoute());
                          }, text: l10n.continueBoarding),
                        )
                      ],
                    ),
                  )
              ),
            )
          )
        ],
      )
    );
  }
}
