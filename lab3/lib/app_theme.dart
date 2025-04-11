import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Common spacing
  static const double paddingTiny = 4.0;
  static double paddingSmall = 8.0;
  static const double paddingMediumSmall = 12.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingHuge = 32.0;

  // Headings
  static const TextStyle largeHeading = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle mediumHeading = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  // Font
  static TextTheme textTheme = GoogleFonts.nunitoTextTheme();

  // App color
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.green,     // Välj något som känns bra
  );
}
