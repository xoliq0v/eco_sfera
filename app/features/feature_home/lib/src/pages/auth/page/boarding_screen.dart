import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart' hide AppImage;

import '../../../constants/app_image.dart';

@RoutePage()
class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          LocaleKeys.appNameM.tr(context: context),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,right: 20,left: 20),
                          child: Text(
                            LocaleKeys.boardingDescription.tr(context: context),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(

                            ),
                          ),
                        ),
                        40.verticalSpace,
                        EcoElevatedButton(
                              onPressed: (){
                            // context.navigateTo(const AuthRoute());
                          }, child: Text(LocaleKeys.continueBoarding.tr(context: context))),
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
