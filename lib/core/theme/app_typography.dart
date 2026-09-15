import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTypography {
  static TextStyle get _outfit => GoogleFonts.outfit();
  static TextStyle get _jakarta => GoogleFonts.plusJakartaSans();

  static TextStyle displayLg = GoogleFonts.outfit(
    fontSize: 56, height: 64 / 56, fontWeight: FontWeight.w800, letterSpacing: -1.12,
  );
  static TextStyle displayLgMobile = GoogleFonts.outfit(
    fontSize: 36, height: 44 / 36, fontWeight: FontWeight.w800, letterSpacing: -0.36,
  );
  static TextStyle displayMd = GoogleFonts.outfit(
    fontSize: 44, height: 52 / 44, fontWeight: FontWeight.w700, letterSpacing: -0.88,
  );
  static TextStyle displayMdMobile = GoogleFonts.outfit(
    fontSize: 30, height: 38 / 30, fontWeight: FontWeight.w700, letterSpacing: -0.30,
  );
  static TextStyle headlineXl = GoogleFonts.outfit(
    fontSize: 36, height: 44 / 36, fontWeight: FontWeight.w700, letterSpacing: -0.54,
  );
  static TextStyle headlineXlMobile = GoogleFonts.outfit(
    fontSize: 26, height: 34 / 26, fontWeight: FontWeight.w700, letterSpacing: -0.26,
  );
  static TextStyle headlineLg = GoogleFonts.outfit(
    fontSize: 28, height: 36 / 28, fontWeight: FontWeight.w700,
  );
  static TextStyle headlineMd = GoogleFonts.outfit(
    fontSize: 22, height: 30 / 22, fontWeight: FontWeight.w600,
  );
  static TextStyle headlineSm = GoogleFonts.outfit(
    fontSize: 18, height: 26 / 18, fontWeight: FontWeight.w600,
  );

  static TextStyle bodyXl = GoogleFonts.plusJakartaSans(
    fontSize: 18, height: 28 / 18, fontWeight: FontWeight.w400,
  );
  static TextStyle bodyLg = GoogleFonts.plusJakartaSans(
    fontSize: 16, height: 26 / 16, fontWeight: FontWeight.w400,
  );
  static TextStyle bodyMd = GoogleFonts.plusJakartaSans(
    fontSize: 14, height: 22 / 14, fontWeight: FontWeight.w400,
  );
  static TextStyle bodySm = GoogleFonts.plusJakartaSans(
    fontSize: 12, height: 18 / 12, fontWeight: FontWeight.w400,
  );

  static TextStyle labelLg = GoogleFonts.plusJakartaSans(
    fontSize: 14, height: 20 / 14, fontWeight: FontWeight.w600, letterSpacing: 0.14,
  );
  static TextStyle labelMd = GoogleFonts.plusJakartaSans(
    fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w600, letterSpacing: 0.24,
  );
  static TextStyle labelSm = GoogleFonts.plusJakartaSans(
    fontSize: 11, height: 14 / 11, fontWeight: FontWeight.w700, letterSpacing: 0.44,
  );

  static TextTheme textTheme = TextTheme(
    displayLarge: displayLg,
    displayMedium: displayMd,
    headlineLarge: headlineXl,
    headlineMedium: headlineLg,
    headlineSmall: headlineMd,
    titleLarge: headlineSm,
    bodyLarge: bodyLg,
    bodyMedium: bodyMd,
    bodySmall: bodySm,
    labelLarge: labelLg,
    labelMedium: labelMd,
    labelSmall: labelSm,
  );
}
