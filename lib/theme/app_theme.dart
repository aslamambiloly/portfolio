import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF0A0A09);
  static const Color foreground = Color(0xFFF5F0E8);
  static const Color primary = Color(0xFFD4AF37); // Classic gold
  static const Color secondary = Color(0xFFFFD700); // Bright/shiny gold
  static const Color accent = Color(0xFFE8A12C); // Warm amber gold
  static const Color card = Color(0xFF141210);
  static const Color cardHover = Color(0xFF1E1B14);
  static const Color border = Color(0xFF2D2518);
  static const Color muted = Color(0xFF1E1B14);
  static const Color mutedForeground = Color(0xFF9B9080);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFFFFD700), // Bright gold
      Color(0xFFD4AF37), // Classic gold
      Color(0xFFB8860B), // Dark goldenrod
      Color(0xFF8B6914), // Deep gold
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: card,
      ),
      // textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
      //     .copyWith(
      //       bodyLarge: GoogleFonts.inter(color: foreground),
      //       bodyMedium: GoogleFonts.inter(color: foreground),
      //     ),
      cardTheme: CardThemeData(
        color: card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: border),
        ),
      ),
      dividerColor: border,
    );
  }
}

enum FontOptions {
  ubuntuBold,
  ubuntuBoldItalic,
  ubuntuLight,
  ubuntuLightItalic,
  ubuntuRegular,
  ubuntuMedium,
  ubuntuMediumItalic,
}
