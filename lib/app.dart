
import 'package:eco_sfera/features/no_internent/presentation/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/assets/l10n/app_localizations.dart';
import 'core/assets/theme/theme.dart';
import 'core/constants/route/app_router.dart';
import 'core/singleton/di.config.dart';
import 'core/utils/bloc/connectivity/connectivity_cubit.dart';
import 'core/utils/bloc/connectivity/connectivity_state.dart';
import 'core/utils/bloc/locale_cubit.dart';
import 'core/utils/bloc/theme_cubit.dart';

class App extends StatelessWidget {
  final LocaleCubit localeCubit;
  App({super.key, required this.localeCubit});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
          create: (BuildContext context) => getIt<ConnectivityBloc>(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => getIt<ThemeCubit>(),
        ),
        BlocProvider<LocaleCubit>.value(
          value: localeCubit,
        ),
      ],
      child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, state) {
            setOrientation(context);
            if (state is ConnectivityNone) {
              return const NoInternetScreen();
            }
            return BlocBuilder<LocaleCubit, Locale>(
              builder: (context, locale) {
                return BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (BuildContext context, ThemeMode theme) {
                    return MaterialApp.router(
                      routerConfig: appRouter.config(),
                      title: 'Eko Sfera',
                      localizationsDelegates: AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      locale: locale,
                      theme: ThemeConfig.light,
                      darkTheme: ThemeConfig.dark,
                      themeMode: theme,
                    );
                  },
                );
              },
            );
          }),
    );
  }
  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600; // Generally, 600dp is considered the breakpoint for tablets
  }
  void setOrientation(BuildContext context) {
    if (isTablet(context)) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }
}

