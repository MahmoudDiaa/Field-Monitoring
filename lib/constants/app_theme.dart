/// Creating custom color palettes is part of creating a custom app. The idea is to create
/// your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
/// object with those colors you just defined.
///
/// Resource:
/// A good resource would be this website: http://mcg.mbitson.com/
/// You simply need to put in the colour you wish to use, and it will generate all shades
/// for you. Your primary colour will be the `500` value.
///
/// Colour Creation:
/// In order to create the custom colours you need to create a `Map<int, Color>` object
/// which will have all the shade values. `const Color(0xFF...)` will be how you create
/// the colours. The six character hex code is what follows. If you wanted the colour
/// #114488 or #D39090 as primary colours in your theme, then you would have
/// `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
///
/// Usage:
/// In order to use this newly created theme or even the colours in it, you would just
/// `import` this file in your project, anywhere you needed it.
/// `import 'path/to/theme.dart';`
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/constants/colors.dart';

class AppThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.titleMedium!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFd21e1d),
    primaryContainer: Color(0xFF9e1718),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryContainer: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.normal;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w800;
  static const _bold = FontWeight.w700;

  static final TextTheme textTheme = GoogleFonts.cairoTextTheme().copyWith(
    headlineMedium: GoogleFonts.cairoTextTheme()
        .headlineMedium
        ?.copyWith(color: CustomColor.primaryColor),
    bodyLarge: GoogleFonts.cairoTextTheme()
        .bodyLarge
        ?.copyWith(color: CustomColor.primaryColor),
    bodyMedium: GoogleFonts.cairoTextTheme()
        .bodyMedium
        ?.copyWith(color: CustomColor.primaryColor),
    bodySmall: GoogleFonts.cairoTextTheme()
        .bodySmall
        ?.copyWith(color: CustomColor.primaryColor),
    displayLarge: GoogleFonts.cairoTextTheme()
        .displayLarge
        ?.copyWith(color: CustomColor.primaryColor),
    displayMedium: GoogleFonts.cairoTextTheme()
        .displayMedium
        ?.copyWith(color: CustomColor.primaryColor),
    displaySmall: GoogleFonts.cairoTextTheme()
        .displaySmall
        ?.copyWith(color: CustomColor.primaryColor),
    titleSmall: GoogleFonts.cairoTextTheme()
        .titleSmall
        ?.copyWith(color: CustomColor.primaryColor),
    headlineLarge: GoogleFonts.cairoTextTheme()
        .headlineLarge
        ?.copyWith(color: CustomColor.primaryColor),
    headlineSmall: GoogleFonts.cairoTextTheme()
        .headlineSmall
        ?.copyWith(color: CustomColor.primaryColor),
    labelLarge: GoogleFonts.cairoTextTheme()
        .labelLarge
        ?.copyWith(color: CustomColor.primaryColor),
    titleMedium: GoogleFonts.cairoTextTheme()
        .titleMedium
        ?.copyWith(color: CustomColor.primaryColor),
    titleLarge: GoogleFonts.cairoTextTheme()
        .titleLarge
        ?.copyWith(color: CustomColor.primaryColor),
    labelSmall: GoogleFonts.cairoTextTheme()
        .labelSmall
        ?.copyWith(color: CustomColor.primaryColor),
    labelMedium: GoogleFonts.cairoTextTheme()
        .labelMedium
        ?.copyWith(color: CustomColor.primaryColor),
  );
//old one
static final TextTheme _textTheme = TextTheme(
  headlineMedium: GoogleFonts.cairo(fontWeight: _bold, fontSize: 20.0),
  bodySmall: GoogleFonts.cairo(fontWeight: _semiBold, fontSize: 16.0),
  headlineSmall: GoogleFonts.cairo(fontWeight: _medium, fontSize: 16.0),
  titleMedium: GoogleFonts.cairo(fontWeight: _medium, fontSize: 16.0),
  labelSmall: GoogleFonts.cairo(fontWeight: _medium, fontSize: 12.0),
  bodyLarge: GoogleFonts.cairo(fontWeight: _regular, fontSize: 14.0,fontStyle: FontStyle.normal),
  titleSmall: GoogleFonts.cairo(fontWeight: _medium, fontSize: 14.0),
  bodyMedium: GoogleFonts.cairo(fontWeight: _regular, fontSize: 16.0,fontStyle: FontStyle.normal),
  titleLarge: GoogleFonts.cairo(fontWeight: _bold, fontSize: 16.0),
  labelLarge: GoogleFonts.cairo(fontWeight: _semiBold, fontSize: 14.0),
);
}
