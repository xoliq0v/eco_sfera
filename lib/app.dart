import 'package:alice/alice.dart';
import 'package:app_bloc/app_bloc.dart';
import 'package:eco_sfera/di/injection.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:navigation/navigation.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = getIt.get<AppRouter>();
  // final _alice = getIt.get<Alice>();

  @override
  void initState() {
    // _alice.setNavigatorKey(_appRouter.navigatorKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: AppLocaleConfig.supportedLocales,
      path: AppLocaleConfig.localePath,
      fallbackLocale: const Locale(AppLocaleConfig.fallbackLocale),
      useOnlyLangCode: true,
      useFallbackTranslations: true,
      // assetLoader: const CodegenLoader(),
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        child: _MaterialApp(appRouter: _appRouter),
      ),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeConfig.light,
      darkTheme: ThemeConfig.dark,
      builder: (context, child) {
        FlutterNativeSplash.remove();
        return Toast(
          navigatorKey: appRouter.navigatorKey,
          child: child ?? const SizedBox(),
        );
      },
      routerConfig: appRouter.config(
        navigatorObservers: () => [
          AppRouteObserver(),
        ],
      ),
    );
  }
}
