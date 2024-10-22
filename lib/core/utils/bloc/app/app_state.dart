import 'package:flutter/material.dart';

import '../utils/bloc/connectivity/connectivity_state.dart';

class AppState {
  ConnectivityState connectivityState;
  final ThemeMode themeMode;
  final Locale locale;

  AppState({
    ConnectivityState? connectivityState,
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
  }) : connectivityState = connectivityState ?? ConnectivityUnknown();
}
