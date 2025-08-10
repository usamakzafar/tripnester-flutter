import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Typography scale using Roboto (open source)
class AppTypography {
  AppTypography._();

  static TextTheme textTheme = GoogleFonts.robotoTextTheme().copyWith(
    displayLarge: GoogleFonts.roboto(
        fontSize: 48, fontWeight: FontWeight.w700, height: 1.15, color: AppColors.charcoal),
    displayMedium: GoogleFonts.roboto(
        fontSize: 40, fontWeight: FontWeight.w700, height: 1.2, color: AppColors.charcoal),
    headlineLarge: GoogleFonts.roboto(
        fontSize: 32, fontWeight: FontWeight.w700, height: 1.25, color: AppColors.charcoal),
    headlineMedium: GoogleFonts.roboto(
        fontSize: 28, fontWeight: FontWeight.w700, height: 1.25, color: AppColors.charcoal),
    titleLarge: GoogleFonts.roboto(
        fontSize: 22, fontWeight: FontWeight.w600, height: 1.25, color: AppColors.charcoal),
    titleMedium: GoogleFonts.roboto(
        fontSize: 18, fontWeight: FontWeight.w600, height: 1.3, color: AppColors.charcoal),
    titleSmall: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w600, height: 1.3, color: AppColors.charcoal),
    bodyLarge: GoogleFonts.roboto(
        fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, color: AppColors.charcoal),
    bodyMedium: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, color: AppColors.charcoal),
    labelLarge: GoogleFonts.roboto(
        fontSize: 14, fontWeight: FontWeight.w600, height: 1.2, color: AppColors.bone), // for buttons on green
    labelMedium: GoogleFonts.roboto(
        fontSize: 12, fontWeight: FontWeight.w600, height: 1.2, color: AppColors.charcoal),
  );
}
