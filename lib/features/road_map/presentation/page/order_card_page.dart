import 'package:eco_sfera/core/assets/l10n/app_localizations.dart';
import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:eco_sfera/core/widgets/fields/eco_text_field.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';

@RoutePage()
class OrderCardPage extends StatefulWidget {
  const OrderCardPage({super.key});

  @override
  State<OrderCardPage> createState() => _OrderCardPageState();
}

class _OrderCardPageState extends State<OrderCardPage> {

  late AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {

    l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.orderCard),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Gap(20),
          EcoTextField(
            topRightText: l10n.neighborhood,
          ),
          const Gap(20),
          EcoTextField(
            topRightText: l10n.transportNumber,
          ),
          const Gap(20),
          EcoTextField(
            topRightText: l10n.typeOfProductReceived,
          ),
          const Gap(20),
          EcoTextField(
            topRightText: l10n.volume,
          ),
          const Expanded(child: SizedBox.shrink()),
          EcoButton(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 60,
              borderRadius: 30,
              onPressed: (){
                context.router.navigate(const SignatureRoute());
              },
              child: Text(l10n.acceptance)
          ),
          const Gap(30)
        ],
      ),
    );
  }
}
