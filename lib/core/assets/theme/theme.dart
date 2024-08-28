import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/assets/theme/text.dart';
import 'package:flutter/material.dart';

abstract class ThemeConfig {

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,

      /// App bar theme configuration
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        titleTextStyle: ThemeOfText.displayLarge,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.main),
      ),

      textTheme: ThemeOfText.theme(),


      colorScheme: const ColorScheme(
        background: Colors.white,
        brightness: Brightness.light,
        primary: AppColors.main,
        secondary: AppColors.glen,
        error: Colors.red,
        surface: Colors.green,
        onPrimary: Colors.purple,
        onSecondary: Colors.yellow,
        onBackground: Colors.pink,
        onError: Colors.redAccent,
        onSurface: Colors.greenAccent,
      ),


    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.blackWash,

      /// App bar theme configuration
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.blackWash,
        titleTextStyle: ThemeOfText.displayLarge,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.main),
      ),

      textTheme: ThemeOfText.theme(),


      colorScheme: const ColorScheme(
        background: AppColors.blackWash,
        brightness: Brightness.dark,
        primary: AppColors.main,
        secondary: AppColors.glen,
        error: Colors.red,
        surface: AppColors.blackWash,
        onPrimary: AppColors.main,
        onSecondary: AppColors.blackWash,
        onBackground: AppColors.blackWash,
        onError: Colors.red,
        onSurface: AppColors.blackWash,
      ),


    );
  }


}