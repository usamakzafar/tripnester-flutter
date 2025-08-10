import 'package:flutter/material.dart';

class AppColors {
  static const Color green = Color(0xFF004E4F); // Primary
  static const Color bone = Color(0xFFFAF8F4); // Surface / background
  static const Color orange = Color(0xFFFF6B4D); // Error / Accent
  static const Color mistGreen = Color(0xFFB5D2C3); // Secondary
  static const Color charcoal = Color(0xFF2B2B2B); // On-surface text
}

// If you need a default ColorScheme to use in ThemeData
final ColorScheme appColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.green,
  onPrimary: AppColors.bone,
  secondary: AppColors.mistGreen,
  onSecondary: AppColors.charcoal,
  error: AppColors.orange,
  onError: AppColors.bone,
  surface: AppColors.bone,
  onSurface: AppColors.charcoal,
);
