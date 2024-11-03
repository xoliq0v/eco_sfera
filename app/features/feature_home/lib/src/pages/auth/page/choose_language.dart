import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class ChooseLanguageScreen extends StatefulWidget  {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.globe03,
                      color: AppColors.main,
                      width: 100,
                      height: 100,
                    ),
                    20.verticalSpace,
                    Text(LocaleKeys.chooseLang,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 20
                    ),),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: EcoMaterialButton(
                        minWidth: double.maxFinite,
                        onPressed: (){
                        // context.navigateTo(const BoardingRoute());
                          navigateAuthPage(context);
                        context.changeCurrentLanguage('uz');
                      }, child: const Text('Uz'),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: EcoMaterialButton(
                          minWidth: double.maxFinite,
                          onPressed: (){
                            navigateAuthPage(context);
                        // context.navigateTo(const BoardingRoute());
                        context.changeCurrentLanguage('ru');
                      }, child: const Text('Ру')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: EcoMaterialButton(
                        minWidth: double.maxFinite,
                        onPressed: (){
                        // context.navigateTo(const BoardingRoute());
                          navigateAuthPage(context);
                        context.changeCurrentLanguage('en');
                      }, child: const Text('En'),),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }

  Future<void> navigateAuthPage(BuildContext context) async {
    return NavigationUtils.getAuthNavigator().navigateAuthPage();
  }

}
