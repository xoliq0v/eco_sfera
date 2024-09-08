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
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          isLandscape ? Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Image.asset(AppImage.boarding,fit: BoxFit.cover,),
          ) : Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppImage.boarding,fit: BoxFit.cover,),
          ),
          Positioned(
            bottom: 0,
            /// Maybe there is issue !
            right: isLandscape ? -MediaQuery.sizeOf(context).width / 8 : 0,
            top: isLandscape ? 0 : MediaQuery.of(context).size.height / 2.2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                  painter: isLandscape ? IPCustomPainter() : RPSCustomPainter(context),
                  child: SizedBox(
                    child: Column(
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
                        EcoButton(
                              onPressed: (){
                            context.navigateTo(const AuthRoute());
                          }, text: l10n.continueBoarding),
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
