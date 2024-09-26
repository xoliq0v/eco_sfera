import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class AdmissionSheet{

  static void show(BuildContext context){

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.85),
      builder: (context) {
        return IntrinsicHeight(
          child: Column(
            children: [
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(250),
                ),
              ),
              const Gap(10),
              Container(
                height: 400,
                width: double.maxFinite,
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
                    const Gap(5),
                    SizedBox(
                      width: double.maxFinite,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: YandexMap(
                                scrollGesturesEnabled: false,
                              rotateGesturesEnabled: false,
                              tiltGesturesEnabled: false,
                              zoomGesturesEnabled: false,
                              nightModeEnabled: Theme.of(context).brightness == Brightness.dark ? true : false,
                            )
                        ),
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: const Text('13.08.2024  11:01'),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Lorem ipsum'),
                          Text('2kg 6 000sum')
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Lorem ipsum'),
                          Text('2kg 6 000sum')
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Lorem ipsum'),
                          Text('2kg 6 000sum')
                        ],
                      ),
                    ),
                    Gap(30),
                    const Padding(
                      padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jami:'),
                          Text('50 000sum')
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );

  }

}