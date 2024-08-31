import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class ThemeOfText {

  static TextTheme theme (ColorScheme colorScheme){
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall(colorScheme),
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelSmall: labelSmall,
    );
  }

  /// EcoSfera text style
  static const displayLarge = TextStyle(
    fontSize: 40,
    color: AppColors.main,
    fontFamily: 'Montserrat',
  );

  static const displayMedium = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w900,
  );

  static TextStyle displaySmall(ColorScheme colorScheme) => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: colorScheme.brightness == Brightness.light ? Colors.white : Colors.black,
  );

  static const headlineMedium = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: AppColors.greatFalls,
  );

  // done
  static const headlineSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.greatFalls,
    letterSpacing: -0.17,
  );

  static const titleLarge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  static const bodyLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const bodyMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const titleSmall = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const bodySmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const labelLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.greatFalls,
  );

}