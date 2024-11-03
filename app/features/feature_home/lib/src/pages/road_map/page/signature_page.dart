
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

@RoutePage()
class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {

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


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.signatureIsWithdrawn.tr(context: context)),
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
                10.verticalSpace,
                EcoSvgButton(width: 55, height: 55, backgroundColor: AppColors.main, onPressed: (){
                  _controller.undo();
                }, icon: AppIcons.undo),
                10.verticalSpace,
                Expanded(
                  child: EcoButton(
                      height: 60,
                      borderRadius: 30,
                      onPressed: (){
                        context.router.navigate(const MapRouteRoute());
                      },
                      child: Text(LocaleKeys.acceptance.tr(context: context))
                  ),
                ),
              ],
            ),
          ),
          30.verticalSpace
        ],
      ),
    );
  }
}
