import 'package:eco_sfera/core/assets/l10n/app_localizations.dart';
import 'package:eco_sfera/core/constants/route/app_router.gr.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_dropdown_button.dart';
import 'package:eco_sfera/core/widgets/fields/eco_text_field.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';

@RoutePage()
class PolygonScreen extends StatefulWidget {
  const PolygonScreen({super.key});

  @override
  State<PolygonScreen> createState() => _PolygonScreenState();
}

class _PolygonScreenState extends State<PolygonScreen> {


  late AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.polygon),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Gap(20),

          EcoTextField(
            topRightText: l10n.responsibleEmployee,
            width: double.maxFinite,
          ),

          const Gap(20),

          EcoDropdownMenu(
            topText: l10n.landfillOperator,
            onChanged: (value){},
            items: const [
              DropdownMenuEntry(value: 'value', label: 'label'),
            ], initialSelection: '',
          ),

          const Gap(20),

          EcoTextField(
            topRightText: l10n.volumeOfWaste,
            width: double.maxFinite,
          ),

          const Gap(70),

          EcoButton(
              onPressed: (){
                context.router.navigate(const SignatureRoute());
              },
            height: 60,
            width: MediaQuery.sizeOf(context).width * 0.9,
            borderRadius: 40,
              child: Text(l10n.acceptance),
          )
          
        ],
      ),
    );
  }
}
