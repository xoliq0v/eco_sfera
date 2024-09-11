import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/buttons/eco_button.dart';
import 'package:eco_sfera/core/widgets/fields/eco_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/route/app_router.gr.dart';


@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            context.router.back();
          },
          icon: const Icon(Icons.keyboard_arrow_left,size: 40,),
          padding: const EdgeInsets.all(5),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            SizedBox(
              child: Column(
                children: [
                  const Icon(
                    Icons.recycling_outlined,
                    color: AppColors.main,
                    size: 110,
                  ),

                  Text(
                    l10n.welcome,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.secondary
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              child: Column(
                children: [
                  EcoTextField(
                    hintText: l10n.login,
                    autocorrect: false,
                    radius: 20,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.usernameCannotBeEmpty;
                      }
                      // Trim the input and compare it to the original value to detect leading or trailing spaces
                      if (value.trim() != value) {
                        return l10n.usernameCannotHaveLeadingOrTrailingSpaces;
                      }
                      if (value.length < 3 || value.length > 30) {
                        return l10n.usernameMustBeBetween3And30Characters;
                      }
                      if (!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(value)) {
                        return l10n.usernameCanOnlyContainLettersNumbersPeriodsAndUnderscores;
                      }
                      // Add more validation rules as needed
                      return null;
                    },
                    validateOnChange: true,
                  ),

                  const Gap(15),

                  EcoTextField(
                    hintText: l10n.password,
                    autocorrect: false,
                    radius: 20,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.passwordCannotBeEmpty;
                      }
                      if (value.length < 8) {
                        return l10n.passwordMustBeAtLeast8CharactersLong;
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return l10n.passwordMustContainAtLeastOneUppercaseLetter;
                      }
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return l10n.passwordMustContainAtLeastOneLowercaseLetter;
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return l10n.passwordMustContainAtLeastOneNumber;
                      }
                      if (!RegExp(r'[!@#\$%\^&\*\(\)_\+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(value)) {
                        return l10n.passwordMustContainAtLeastOneSpecialCharacter;
                      }
                      if (value.contains(' ')) {
                        return l10n.passwordCannotContainSpaces;
                      }
                      // Add more validation rules as needed
                      return null;
                    },
                    validateOnChange: true,
                    obscureText: true,
                    iconColor: AppColors.greatFalls,

                  ),

                  const Gap(15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: EcoButton(
                      onPressed: (){
                        context.navigateTo(MainRoute());
                      },
                      child: Text(l10n.enter),
                      borderRadius: 30,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      )
    );
  }
}
