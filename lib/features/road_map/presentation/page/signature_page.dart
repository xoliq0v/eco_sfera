import 'package:eco_sfera/core/assets/l10n/app_localizations.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_svg_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:gap/gap.dart';
import 'package:signature/signature.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/constants/route/app_router.gr.dart';
import '../../../../core/widgets/buttons/eco_button.dart';

@RoutePage()
class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {

  late AppLocalizations l10n;

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 2,
    penColor: AppColors.main,
    exportBackgroundColor: AppColors.alpineGoat,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.signatureIsWithdrawn),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.alpineGoat
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Signature(
                    controller: _controller,
                    backgroundColor: AppColors.alpineGoat,
                  ),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                EcoSvgButton(width: 55, height: 55, backgroundColor: AppColors.main, onPressed: (){
                  _controller.clear();
                }, icon: AppIcons.trash),
                const Gap(10),
                EcoSvgButton(width: 55, height: 55, backgroundColor: AppColors.main, onPressed: (){
                  _controller.undo();
                }, icon: AppIcons.undo),
                const Gap(10),
                Expanded(
                  child: EcoButton(
                      height: 60,
                      borderRadius: 30,
                      onPressed: (){
                        context.router.navigate(const MapRouteRoute());
                      },
                      child: Text(l10n.acceptance)
                  ),
                ),
              ],
            ),
          ),
          const Gap(30)
        ],
      ),
    );
  }
}
