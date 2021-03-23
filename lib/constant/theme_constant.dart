import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConstant {
  /// How to get a color:
  /// ```
  /// Theme.of(context).primaryColor;
  /// ...
  /// ```
  static final ThemeData themeData = ThemeData(
    textTheme: textTheme,
    primaryColor: Color(0xFFDC5F46),
    backgroundColor: Color(0xFF213F5C),
  );

  /// Text Theme Usage:
  /// 1. Get a text style, example headline1:
  /// ```
  /// Theme.of(context).headline1;
  /// Theme.of(context).body1;
  /// Theme.of(context).subtitle1;
  /// ...
  /// ```
  ///
  /// 2. Get a text style with different text color, other other attribute:
  /// ```
  /// Theme.of(context).bodyText1.copy(color: Colors.red);
  /// Theme.of(context).bodyText1.copy(color: Colors.red, fontWeight: FontWeight.bold,);
  /// ...
  /// ```
  static final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.quicksand(
      fontSize: 98,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: GoogleFonts.quicksand(
      fontSize: 61,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: GoogleFonts.quicksand(
      fontSize: 49,
      fontWeight: FontWeight.w400,
    ),
    headline4: GoogleFonts.quicksand(
      fontSize: 35,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: GoogleFonts.quicksand(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    headline6: GoogleFonts.quicksand(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: GoogleFonts.quicksand(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: GoogleFonts.quicksand(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white.withOpacity(0.5),
  );
}
