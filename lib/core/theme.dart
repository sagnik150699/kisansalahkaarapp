import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primarySeedColor = Color(0xFF2E7D32); // A deep green for a farming app

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primarySeedColor,
      brightness: Brightness.light,
      primary: primarySeedColor,
      secondary: Colors.amber,
      surface: Colors.grey[50],
    );

    final textTheme = GoogleFonts.latoTextTheme(ThemeData.light().textTheme).copyWith(
      displayLarge: GoogleFonts.oswald(fontSize: 57, fontWeight: FontWeight.bold, color: colorScheme.primary),
      titleLarge: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
      bodyMedium: GoogleFonts.lato(fontSize: 14, color: colorScheme.onSurface),
      labelLarge: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500, color: colorScheme.onPrimary),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primarySeedColor,
      brightness: Brightness.dark,
      primary: primarySeedColor,
      secondary: Colors.amber,
      surface: Colors.grey[850],
    );

    final textTheme = GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.oswald(fontSize: 57, fontWeight: FontWeight.bold, color: colorScheme.primary),
      titleLarge: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
      bodyMedium: GoogleFonts.lato(fontSize: 14, color: colorScheme.onSurface),
      labelLarge: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500, color: colorScheme.onPrimary),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 4,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}
