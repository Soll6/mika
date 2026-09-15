import 'package:flutter/material.dart';

/// MIKA Services — Design System Colors
/// Source: Stitch project 3538147067575376540 — BTP Prestige & Ingénierie
/// Fidélité : orange BTP #EA7317, bleu institutionnel #0D47A1 / #2B5BB5, ardoise #0F172A
abstract class AppColors {
  // Primary — Orange BTP Gabon #EA7317
  static const primary = Color(0xFF9A4600); // dark primary for contrast
  static const primaryContainer = Color(0xFFEA7317);
  static const primaryFixed = Color(0xFFFFDBC9);
  static const primaryFixedDim = Color(0xFFFFB68C);
  static const inversePrimary = Color(0xFFFFB68C);
  static const onPrimary = Color(0xFFFFFFFF);
  static const onPrimaryContainer = Color(0xFF4E2000);
  static const onPrimaryFixed = Color(0xFF321200);
  static const onPrimaryFixedVariant = Color(0xFF753400);

  // Secondary — Bleu Royal Institutionnel
  static const secondary = Color(0xFF2B5BB5);
  static const secondaryContainer = Color(0xFF759EFD);
  static const secondaryFixed = Color(0xFFD9E2FF);
  static const secondaryFixedDim = Color(0xFFB0C6FF);
  static const onSecondary = Color(0xFFFFFFFF);
  static const onSecondaryContainer = Color(0xFF00337C);
  static const onSecondaryFixed = Color(0xFF001945);
  static const onSecondaryFixedVariant = Color(0xFF00429C);

  // Tertiary — Noir Ardoise Industriel
  static const tertiary = Color(0xFF565E74);
  static const tertiaryContainer = Color(0xFF8C94AC);
  static const tertiaryFixed = Color(0xFFDAE2FD);
  static const tertiaryFixedDim = Color(0xFFBEC6E0);
  static const onTertiary = Color(0xFFFFFFFF);
  static const onTertiaryContainer = Color(0xFF252D41);
  static const onTertiaryFixed = Color(0xFF131B2E);
  static const onTertiaryFixedVariant = Color(0xFF3F465C);

  // Surfaces
  static const surface = Color(0xFFF8F9FF);
  static const surfaceBright = Color(0xFFF8F9FF);
  static const surfaceDim = Color(0xFFCBDBF5);
  static const surfaceVariant = Color(0xFFD3E4FE);
  static const surfaceContainer = Color(0xFFE5EEFF);
  static const surfaceContainerLow = Color(0xFFEFF4FF);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerHigh = Color(0xFFDCE9FF);
  static const surfaceContainerHighest = Color(0xFFD3E4FE);
  static const surfaceTint = Color(0xFF9A4600);
  static const background = Color(0xFFF8F9FF);

  static const onSurface = Color(0xFF0B1C30);
  static const onSurfaceVariant = Color(0xFF574237);
  static const onBackground = Color(0xFF0B1C30);
  static const inverseSurface = Color(0xFF213145);
  static const inverseOnSurface = Color(0xFFEAF1FF);

  // Outlines
  static const outline = Color(0xFF8B7265);
  static const outlineVariant = Color(0xFFDEC1B1);

  // Errors
  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);

  // Success / Status
  static const success = Color(0xFF15803D);
  static const successBg = Color(0xFFDCFCE7); // rgba 22,163,74,0.12 approx
  static const warning = Color(0xFFEA7317);
  static const warningBg = Color(0xFFFFF7ED);

  // Overlays for light/dark
  static const onSurfaceDark = Color(0xFF0B1C30);

  static const ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    surfaceContainerHighest: surfaceContainerHighest,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainer: surfaceContainer,
    surfaceContainerLow: surfaceContainerLow,
    surfaceDim: surfaceDim,
    outline: outline,
    outlineVariant: outlineVariant,
    scrim: Color(0xFF000000),
    shadow: Color(0xFF000000),
    inverseSurface: inverseSurface,
    onInverseSurface: inverseOnSurface,
    inversePrimary: inversePrimary,
  );
}
