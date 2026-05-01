import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF000000);
  static const Color foreground = Color(0xFFF1F1F3);
  static const Color primary = Color(0xFF0C87F2);
  static const Color secondary = Color(0xFF9857F2);
  static const Color accent = Color(0xFFD94EB4);
  static const Color card = Color(0xFF16161D);
  static const Color cardHover = Color(0xFF1B1B25);
  static const Color border = Color(0xFF292931);
  static const Color muted = Color(0xFF292931);
  static const Color mutedForeground = Color(0xFFAFAFB3);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF0C87F2),
      Color(0xFF9857F2),
      Color(0xFFB052D9),
      Color(0xFFD94EB4),
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
