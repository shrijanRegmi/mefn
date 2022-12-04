import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mefn/utils/app_colors.dart';

class AppTheme {
  static Brightness? _brightness;

  static ThemeData get _defaultTheme {
    return ThemeData(
      brightness: _brightness,
      fontFamily: GoogleFonts.nunito().fontFamily,
    );
  }

  static ThemeData get lightThemePalette {
    _brightness = Brightness.light;
    return _defaultTheme.copyWith(
      scaffoldBackgroundColor: kcCream,
      appBarTheme: _defaultTheme.appBarTheme.copyWith(
        elevation: null,
        backgroundColor: kcCream,
        shadowColor: kcExtraLightGrey,
        titleTextStyle: GoogleFonts.nunito().copyWith(
          color: _defaultTheme.textTheme.titleLarge?.color,
        ),
        iconTheme: IconThemeData(
          color: _defaultTheme.textTheme.titleLarge?.color,
        ),
      ),
      colorScheme: _defaultTheme.colorScheme.copyWith(
        primary: kcPrimary,
        secondary: kcSecondary,
        background: kcContainerBg,
        shadow: kcExtraLightGrey,
      ),
    );
  }

  static ThemeData get darkThemePalette {
    _brightness = Brightness.dark;
    return _defaultTheme.copyWith(
      appBarTheme: _defaultTheme.appBarTheme.copyWith(
        elevation: null,
        backgroundColor: kcContainerBgDark,
        shadowColor: kcBlack.withOpacity(0.5),
      ),
      colorScheme: _defaultTheme.colorScheme.copyWith(
        primary: kcPrimaryDark,
        secondary: kcSecondaryDark,
        background: kcContainerBgDark,
        shadow: kcBlack.withOpacity(0.5),
      ),
    );
  }
}
