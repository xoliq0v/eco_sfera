
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20
                ),
                child: DecoratedBox(
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                EcoSvgButton(width: 55, height: 55, backgroundColor: AppColors.main, onPressed: (){
                  _controller.clear();
                }, icon: AppIcons.trash),
                10.horizontalSpace,
                EcoSvgButton(width: 55, height: 55, backgroundColor: AppColors.main, onPressed: (){
                  _controller.undo();
                }, icon: AppIcons.undo),
                10.horizontalSpace,
                Expanded(
                  child: EcoButton(
                      height: 60,
                      borderRadius: 30,
                      onPressed: (){
                        navigateMapRoutePage();
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

  Future<void> navigateMapRoutePage() async{
    NavigationUtils.getMainNavigator().navigateMapRoutePage();
  }
}
