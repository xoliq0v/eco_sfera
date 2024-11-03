
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class OrderBottomSheet {
  static void show(BuildContext context, String fromWhere) {
    context.showCustomBarModalBottomSheet(
      builder: (context) {
        return IntrinsicHeight(
          child: Column(
            children: [
              SizedBox(
                width: 60,
                height: 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(250),
                  ),
                ),
              ),
              10.verticalSpace,
              SizedBox(
                height: 270,
                width: double.maxFinite,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      15.verticalSpace,
                      Align(
                        child: Text(
                            '5 daqiqa • 2 km',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      const Divider(color: Colors.grey,),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 20,
                          bottom: 5
                        ),
                          child: Text(LocaleKeys.fromWhere.tr(context: context),style: Theme.of(context).textTheme.headlineMedium,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          bottom: 15
                        ),
                        child: Text(
                            fromWhere,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15,
                            left: 15,
                            bottom: 10,
                            top: 20
                          ),
                          child: EcoButton(
                              width: double.maxFinite,
                              height: 60,
                              borderRadius: 30,
                              onPressed: (){
                                context.popBottomSheet();
                              },
                              child: Text(LocaleKeys.acceptance.tr(context: context))
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}