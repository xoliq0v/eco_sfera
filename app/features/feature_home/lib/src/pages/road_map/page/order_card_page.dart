

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderCardPage extends StatefulWidget {
  const OrderCardPage({super.key});

  @override
  State<OrderCardPage> createState() => _OrderCardPageState();
}

class _OrderCardPageState extends State<OrderCardPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.orderCard.tr(context: context)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          20.verticalSpace,
          EcoTextField(
            topRightText: LocaleKeys.neighborhood.tr(context: context),
          ),
          20.verticalSpace,
          EcoTextField(
            topRightText: LocaleKeys.transportNumber.tr(context: context),
          ),
          20.verticalSpace,
          EcoTextField(
            topRightText: LocaleKeys.typeOfProductReceived.tr(context: context),
          ),
          20.verticalSpace,
          EcoTextField(
            topRightText: LocaleKeys.volume.tr(context: context),
          ),
          const Expanded(child: SizedBox.shrink()),
          EcoButton(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 60,
              borderRadius: 30,
              onPressed: (){
                context.router.navigate(const SignatureRoute());
              },
              child: Text(LocaleKeys.acceptance.tr(context: context))
          ),
          30.verticalSpace
        ],
      ),
    );
  }
}
