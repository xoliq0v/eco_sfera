
import 'package:eco_sfera/core/assets/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/assets/l10n/app_localizations.dart';
import 'core/constants/route/app_router.dart';
import 'core/singelton/di.dart';
import 'core/utils/bloc/theme_cubit.dart';


void main() {
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => getIt<ThemeCubit>(),
        ),
      ],
      // context.read<ThemeCubit>().setThemeMode(ThemeMode.dark);
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode){
          return MaterialApp.router(
            routerConfig: appRouter.config(),
            title: 'Eko Sfera',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeConfig.light,
            darkTheme: ThemeConfig.dark,
            themeMode: themeMode,
          );
        },
      )
    );
  }
}