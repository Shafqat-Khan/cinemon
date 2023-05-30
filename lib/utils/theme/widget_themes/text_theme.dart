import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displayLarge: GoogleFonts.montserrat(
          color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.montserrat(
          color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w700),
      displaySmall: GoogleFonts.poppins(
          color: Colors.white, fontSize: 22.0),
      headlineMedium: GoogleFonts.poppins(
          color: Colors.white, fontSize: 18.0),
      titleLarge: GoogleFonts.poppins(
          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.poppins(
          color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.normal),
      bodyMedium: GoogleFonts.poppins(
          color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.normal));
  static TextTheme darkTextTheme = TextTheme(
      // displayMedium: GoogleFonts.montserrat(color: Colors.white70),
      // titleSmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 24)
      );
}
