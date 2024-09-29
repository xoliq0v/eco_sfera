import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../assets/l10n/app_localizations.dart';
import '../../utils/bloc/locale_cubit.dart';
import '../buttons/eco_button.dart';

class ChangeLanguageSheet {
  static const Map<String, String> _languageCodes = {
    'English': 'en',
    'O`zbek': 'uz',
    'Русский': 'ru',
  };

  static void show(BuildContext context) {
    final l10n = context.l10n;
    final currentLocale = Localizations.localeOf(context).languageCode;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.85),
      builder: (context) => _ChangeLanguageContent(l10n: l10n, currentLocale: currentLocale),
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
  final AppLocalizations l10n;
  final String currentLocale;

  const _ChangeLanguageContent({Key? key, required this.l10n, required this.currentLocale}) : super(key: key);

  @override
  _ChangeLanguageContentState createState() => _ChangeLanguageContentState();
}

class _ChangeLanguageContentState extends State<_ChangeLanguageContent> {
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = ChangeLanguageSheet.getLanguageFromCode(widget.currentLocale);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(250),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Align(
                    child: Text(
                      widget.l10n.selectALanguage,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Gap(20),
                  ..._buildLanguageOptions(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                      child: EcoButton(
                        width: double.infinity,
                        height: 60,
                        borderRadius: 30,
                        onPressed: () => _changeLanguage(context),
                        child: Text(widget.l10n.select),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

  void _changeLanguage(BuildContext context) {
    final languageCode = ChangeLanguageSheet._languageCodes[_selectedLanguage] ?? 'en';
    context.read<LocaleCubit>().changeLocale(languageCode);
    Navigator.pop(context);
  }
}