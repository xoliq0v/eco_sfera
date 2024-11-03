import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

extension EcoColorScheme on ColorScheme {
  Color get cardColor => brightness == Brightness.light
      ? AppColors.mintZest // Light theme card color
      : AppColors.dynamicBlack; // Dark theme card color

  Color get textButton => brightness == Brightness.light
      ? Colors.white // Light theme card color
      : Colors.black; // Dark theme card color

}