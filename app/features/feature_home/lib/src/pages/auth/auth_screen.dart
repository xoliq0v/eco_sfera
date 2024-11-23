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
        BlocProvider<AuthCubit>(
          create: (context) {
            return AppBlocHelper.getAuthCubit();
          },
        ),
      ],
      child: this,
    );
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final authShakeKey = GlobalKey<ShakeWidgetState>();
  final _formKey = GlobalKey<FormState>();

  bool _isUsernameValid = false;
  bool _isPasswordValid = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (error) {
                isLoading.value = false;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
              },
              success: () {
                isLoading.value = false;
                navigateCategoryPage(context);
              },
            );
          },
        ),
      ],
      child: Scaffold(
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {
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
                                  controller: usernameController,
                                  onChanged: (value) {
                                    setState(() {
                                      _isUsernameValid = _validateUsername(value) == null;
                                    });
                                  },
                                  validator: _validateUsername,
                                  validateOnChange: true,
                                ),
                                15.verticalSpace,
                                EcoTextField(
                                  hintText: LocaleKeys.password.tr(context: context),
                                  autocorrect: false,
                                  radius: 20,
                                  controller: passwordController,
                                  onChanged: (value) {
                                    setState(() {
                                      _isPasswordValid = _validatePassword(value) == null;
                                    });
                                  },
                                  // validator: _validatePassword,
                                  validateOnChange: true,
                                  obscureText: true,
                                  iconColor: AppColors.greatFalls,
                                ),
                                30.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: ValueListenableBuilder(
                                    builder: (BuildContext context, bool value, Widget? child) {
                                      return EcoElevatedButton.loading(
                                        onPressed: (_isUsernameValid) ? _auth : null,
                                        loading: value,
                                        child: Text(
                                          LocaleKeys.enter.tr(context: context),
                                          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
                                        ),
                                      );
                                    },
                                    valueListenable: isLoading,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String? _validateUsername(String? value) {
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
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.passwordCannotBeEmpty.tr(context: context);
    }
    if (value.length < 8) {
      return LocaleKeys.passwordMustBeAtLeast8CharactersLong.tr(context: context);
    }
    if (value.contains(' ')) {
      return LocaleKeys.passwordCannotContainSpaces.tr(context: context);
    }
    return null;
  }

  void _auth() {
    if (!_formKey.currentState!.validate()) {
      authShakeKey.currentState?.shake();
      return;
    }

    isLoading.value = true;
    final authCubit = context.read<AuthCubit>();
    authCubit.login(
      login: usernameController.text,
      password: passwordController.text,
    );
  }

  Future<void> navigateCategoryPage(BuildContext context) async {
    return NavigationUtils.getAuthNavigator().navigateCategoryPage();
  }
}