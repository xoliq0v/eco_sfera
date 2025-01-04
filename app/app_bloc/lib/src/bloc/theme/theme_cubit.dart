import 'package:app_bloc/app_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ThemeChangerCubit extends Cubit<ThemeData> {
  ThemeChangerCubit() : super(_lightTheme);

  static final ThemeData _lightTheme = ThemeConfig.light;

  static final ThemeData _darkTheme = ThemeConfig.dark;

  void toggleTheme() {
    emit(state.brightness == Brightness.light ? _darkTheme : _lightTheme);
  }
}
