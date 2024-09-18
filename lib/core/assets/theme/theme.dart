import 'package:flutter/material.dart';
import 'package:eco_sfera/core/assets/theme/app_colors.dart';

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
      onSecondary: AppColors.mintZest,
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
        titleTextStyle: TextStyle(
          fontSize: 25,
          color: AppColors.blackWash,
          fontWeight: FontWeight.w700
        ),
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
      textTheme: const TextTheme(
        displayLarge: const TextStyle(
          fontSize: 40,
          color: AppColors.main,
          fontFamily: 'Montserrat',
        ),
        displayMedium: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
        ),
        displaySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        headlineMedium: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppColors.greatFalls,
        ),
        headlineSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.greatFalls,
          letterSpacing: -0.17,
        ),
        titleLarge: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.greatFalls,
        ),
      ),
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
      onSecondary: AppColors.dynamicBlack,
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
        titleTextStyle: TextStyle(
          fontSize: 40,
          color: AppColors.main,
          fontFamily: 'Montserrat',
        ),
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
      colorScheme: colorScheme,
      textTheme: const TextTheme(
        displayLarge: const TextStyle(
          fontSize: 40,
          color: AppColors.main,
          fontFamily: 'Montserrat',
        ),
        displayMedium: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
        ),
        displaySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        headlineMedium: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppColors.greatFalls,
        ),
        headlineSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.greatFalls,
          letterSpacing: -0.17,
        ),
        titleLarge: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.greatFalls,
        ),
      ),
    );
  }
}