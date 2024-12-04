import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle primary = GoogleFonts.poppins();
  static final TextStyle secondary = GoogleFonts.leagueSpartan();

  static final TextTheme textScheme = TextTheme(
    headlineLarge: primary,
    headlineMedium: primary,
    headlineSmall: primary,

    bodyLarge: secondary,
    bodyMedium: secondary,
    bodySmall: secondary
  );
}