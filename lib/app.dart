import 'package:app_bloc/app_bloc.dart';
import 'package:eco_sfera/di/injection.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:navigation/navigation.dart';
import 'package:alice/alice.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = getIt.get<AppRouter>();
  final _alice = getIt.get<Alice>();

  @override
  void initState() {
    _alice.setNavigatorKey(_appRouter.navigatorKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeChangerCubit>(
      create: (_) => AppBlocHelper.getThemeChangeCubit(),
      child: EasyLocalization(
        supportedLocales: AppLocaleConfig.supportedLocales,
        path: AppLocaleConfig.localePath,
        fallbackLocale: const Locale(AppLocaleConfig.fallbackLocale),
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          child: DeviceOrientationLock(
            child: _MaterialApp(appRouter: _appRouter),
          ),
        ),
      ),
    );
  }
}

class DeviceOrientationLock extends StatelessWidget {
  final Widget child;

  const DeviceOrientationLock({required this.child});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width >= 600;
    if (isTablet) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    // Return the child widget so that orientation lock is applied to it
    return child;
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeChangerCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: theme,
          builder: (context, child) {
            FlutterNativeSplash.remove();
            return Toast(
              navigatorKey: appRouter.navigatorKey,
              child: child ?? const SizedBox.shrink(),
            );
          },
          routerConfig: appRouter.config(
            navigatorObservers: () => [
              AppRouteObserver(),
            ],
          ),
        );
      },
    );
  }
}
