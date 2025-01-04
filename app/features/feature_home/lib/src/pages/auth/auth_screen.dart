import 'package:core/core.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:model/model.dart';
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
          create: (_) => AppBlocHelper.getInternetConnectivityController(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => AppBlocHelper.getAuthCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _isLoading = ValueNotifier<bool>(false);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authShakeKey = GlobalKey<ShakeWidgetState>();
  final _formKey = GlobalKey<FormState>();

  bool _isUsernameValid = false;
  bool _isPasswordValid = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.when(
              error: (error) {
                _isLoading.value = false;
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error))
                );
              },
              success: (AuthType type) {
                _isLoading.value = false;
                navigateMainPage(context,type);
              },
              init: () {},
              loading: () {
                _isLoading.value = true;
              },
            );
          },
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Material(
          color: theme.scaffoldBackgroundColor,
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            const Icon(
                              Icons.recycling_outlined,
                              color: AppColors.main,
                              size: 110,
                            ),
                            Text(
                              LocaleKeys.welcome.tr(context: context),
                              style: theme.textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(height: 100),
                            EcoTextField(
                              key: const Key('username_field'),
                              hintText: LocaleKeys.login.tr(context: context),
                              autocorrect: false,
                              radius: 20,
                              controller: _usernameController,
                              onChanged: (value) {
                                setState(() {
                                  _isUsernameValid = _validateUsername(value) == null;
                                });
                              },
                              validator: _validateUsername,
                              validateOnChange: true,
                            ),
                            const SizedBox(height: 15),
                            EcoTextField(
                              key: const Key('password_field'),
                              hintText: LocaleKeys.password.tr(context: context),
                              autocorrect: false,
                              radius: 20,
                              controller: _passwordController,
                              onChanged: (value) {
                                setState(() {
                                  _isPasswordValid = _validatePassword(value) == null;
                                });
                              },
                              validator: _validatePassword,
                              validateOnChange: true,
                              obscureText: true,
                              iconColor: AppColors.greatFalls,
                            ),
                            const SizedBox(height: 30),
                            ValueListenableBuilder(
                              valueListenable: _isLoading,
                              builder: (context, bool isLoading, _) {
                                return EcoElevatedButton.loading(
                                  key: const Key('login_button'),
                                  onPressed: (_isUsernameValid && _isPasswordValid)
                                      ? () {
                                    if (!_formKey.currentState!.validate()) {
                                      _authShakeKey.currentState?.shake();
                                      return;
                                    }
                                    context.read<AuthCubit>().login(
                                      login: _usernameController.text,
                                      password: _passwordController.text,
                                    );
                                  }
                                      : null,
                                  loading: isLoading,
                                  child: Text(
                                    LocaleKeys.enter.tr(context: context),
                                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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

  Future<void> navigateMainPage(BuildContext context,AuthType type) async{
    return await NavigationUtils.getMainNavigator().navigateMainPage(type: type);
  }
}