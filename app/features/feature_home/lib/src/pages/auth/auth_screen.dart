import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:navigation/navigation.dart';

@RoutePage()
class AuthScreen extends StatefulWidget implements AutoRouteWrapper {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetConnectivityController>(
          create: (context) {
            return AppBlocHelper.getInternetConnectivityController();
          },
        ),
      ],
      child: this,
    );
  }
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: (){
                            context.router.popForced();
                          },
                          icon: const Icon(Icons.keyboard_arrow_left, size: 40),
                          padding: const EdgeInsets.all(5),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            50.verticalSpace,
                            const Icon(
                              Icons.recycling_outlined,
                              color: AppColors.main,
                              size: 110,
                            ),
                            Text(
                              LocaleKeys.welcome.tr(context: context),
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            100.verticalSpace,
                            EcoTextField(
                              hintText: LocaleKeys.login.tr(context: context),
                              autocorrect: false,
                              radius: 20,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.usernameCannotBeEmpty.tr(context: context);
                                }
                                if (value.trim() != value) {
                                  return LocaleKeys.usernameCannotHaveLeadingOrTrailingSpaces.tr(context: context);
                                }
                                if (value.length < 3 || value.length > 30) {
                                  return LocaleKeys.usernameMustBeBetween3And30Characters.tr(context: context);
                                }
                                if (!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(value)) {
                                  return LocaleKeys.usernameCanOnlyContainLettersNumbersPeriodsAndUnderscores.tr(context: context);
                                }
                                return null;
                              },
                              validateOnChange: true,
                              controller: null,
                            ),
                            15.verticalSpace,
                            EcoTextField(
                              hintText: LocaleKeys.password.tr(context: context),
                              autocorrect: false,
                              radius: 20,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return LocaleKeys.passwordCannotBeEmpty.tr(context: context);
                                }
                                if (value.length < 8) {
                                  return LocaleKeys.passwordMustBeAtLeast8CharactersLong.tr(context: context);
                                }
                                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                  return LocaleKeys.passwordMustContainAtLeastOneUppercaseLetter.tr(context: context);
                                }
                                if (!RegExp(r'[a-z]').hasMatch(value)) {
                                  return LocaleKeys.passwordMustContainAtLeastOneLowercaseLetter.tr(context: context);
                                }
                                if (!RegExp(r'[0-9]').hasMatch(value)) {
                                  return LocaleKeys.passwordMustContainAtLeastOneNumber.tr(context: context);
                                }
                                if (!RegExp(r'[!@#\$%\^&\*\(\)_\+\-=\[\]{};:"\\|,.<>\/?]').hasMatch(value)) {
                                  return LocaleKeys.passwordMustContainAtLeastOneSpecialCharacter.tr(context: context);
                                }
                                if (value.contains(' ')) {
                                  return LocaleKeys.passwordCannotContainSpaces.tr(context: context);
                                }
                                return null;
                              },
                              validateOnChange: true,
                              obscureText: true,
                              iconColor: AppColors.greatFalls,
                              controller: null,
                            ),
                            30.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: EcoMaterialButton(
                                onPressed: () {
                                  navigateCategoryPage(context);
                                },
                                child: Text(
                                  LocaleKeys.enter.tr(context: context),
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> navigateCategoryPage(BuildContext context) async {
    return NavigationUtils.getAuthNavigator().navigateCategoryPage();
  }
}