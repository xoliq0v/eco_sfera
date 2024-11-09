import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class ChooseLanguagePage extends StatelessWidget {
  const ChooseLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHeader(context),
              _buildLanguageButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppIcons.globe03,
          color: AppColors.main,
          width: 100,
          height: 100,
        ),
        20.verticalSpace,
        Text(
          LocaleKeys.chooseLang.tr(context: context),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildLanguageButtons(BuildContext context) {
    const List<Map<String, String>> languages = [
      {'code': 'uz', 'label': 'Uz'},
      {'code': 'ru', 'label': 'Ру'},
      {'code': 'en', 'label': 'En'},
    ];

    return Column(
      children: languages.map((lang) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: EcoMaterialButton(
            minWidth: 500,
            onPressed: () {
              _changeLanguageAndNavigate(context, lang['code']!);
            },
            child: Text(
              lang['label']!,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }

  Future<void> _changeLanguageAndNavigate(BuildContext context, String languageCode) async {
    context.changeCurrentLanguage(languageCode);
    await NavigationUtils.getAuthNavigator().navigateBoardingPage();
  }
}
