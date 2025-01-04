
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ChangeLanguageSheet {
  static const Map<String, String> _languageCodes = {
    'English': 'en',
    'O`zbek': 'uz',
    'Русский': 'ru',
  };

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.85),
      builder: (context) => _ChangeLanguageContent(),
    );
  }

  static String getLanguageFromCode(String code) {
    return _languageCodes.entries.firstWhere(
          (entry) => entry.value == code,
      orElse: () => const MapEntry('English', 'en'),
    ).key;
  }
}

class _ChangeLanguageContent extends StatefulWidget {

  const _ChangeLanguageContent({Key? key,}) : super(key: key);

  @override
  _ChangeLanguageContentState createState() => _ChangeLanguageContentState();
}

class _ChangeLanguageContentState extends State<_ChangeLanguageContent> {
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLanguage = ChangeLanguageSheet.getLanguageFromCode(context.currentLocale());
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 70,
          height: 4,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(250),
          ),
        ),
        10.verticalSpace,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Align(
                child: Text(
                  LocaleKeys.selectALanguage.tr(context: context),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              20.verticalSpace,
              ..._buildLanguageOptions(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: EcoButton(
                    width: double.infinity,
                    height: 60,
                    borderRadius: 30,
                    onPressed: () async => await _changeLanguage(context),
                    child: Text(LocaleKeys.select.tr(context: context),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildLanguageOptions() {
    return ChangeLanguageSheet._languageCodes.keys.map((language) {
      return RadioListTile<String>(
        title: Text(language),
        value: language,
        groupValue: _selectedLanguage,
        onChanged: (value) => setState(() => _selectedLanguage = value!),
      );
    }).toList();
  }

  Future<void> _changeLanguage(BuildContext context) async {
    final languageCode = ChangeLanguageSheet._languageCodes[_selectedLanguage] ?? 'en';
    context.changeCurrentLanguage(languageCode);
    context.router.pop();
  }
}