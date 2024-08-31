import 'package:flutter/material.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/core/assets/theme/text.dart';

abstract class ThemeConfig {
  static ThemeData get light {
    ColorScheme colorScheme = const ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      primary: Colors.black,
      secondary: AppColors.main,
      error: Colors.red,
      surface: AppColors.alpineGoat,
      onPrimary: Colors.purple,
      onSecondary: Colors.yellow,
      onBackground: Colors.pink,
      onError: Colors.redAccent,
      onSurface: Colors.black,
    );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        titleTextStyle: ThemeOfText.displayLarge,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.secondary, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.error, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)),
      ),

      colorScheme: colorScheme,
      textTheme: ThemeOfText.theme(colorScheme),
    );

  }

  static ThemeData get dark {
    ColorScheme colorScheme = const ColorScheme(
      background: AppColors.blackWash,
      brightness: Brightness.dark,
      primary: Colors.white,
      secondary: AppColors.glen,
      error: Colors.red,
      surface: AppColors.blackOut,
      onPrimary: AppColors.main,
      onSecondary: AppColors.blackWash,
      onBackground: AppColors.blackWash,
      onError: Colors.red,
      onSurface: Colors.white,
    );
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.blackWash,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.blackWash,
        titleTextStyle: ThemeOfText.displayLarge,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colorScheme.surface,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.secondary, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error, width: 2.0),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)),
        ),
      textTheme: ThemeOfText.theme(colorScheme),
      colorScheme: colorScheme,

    );
  }
}