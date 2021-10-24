

import 'package:don/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Light Mode
ThemeData themeDataLight(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
    primaryColor: primaryColor,
    errorColor: errorLight,
    primarySwatch: Colors.blue,
    hintColor: accentLight,
    cardColor: cardLightColor,
    brightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryLight,
    ),
    unselectedWidgetColor: unSelectedLight,
    scaffoldBackgroundColor: backgroundLight,
    backgroundColor: backgroundLight,
    iconTheme: IconThemeData(color: backgroundDark),
    primaryIconTheme: IconThemeData(color: backgroundDark),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    indicatorColor: primaryLight,
    buttonTheme: ButtonThemeData(
      minWidth: 120.0,
      height: 45.0,
      buttonColor: primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: selectedLight,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryLight,
        ),
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    headline1: GoogleFonts.inter(
      color: whiteShadeColor,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    headline2: GoogleFonts.inter(
      color: primaryLight,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headline3: GoogleFonts.inter(
      color: primaryLight,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    headline4: GoogleFonts.inter(
      color: primaryLight,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
      headline5: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    bodyText1: GoogleFonts.inter(
      color: blackColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w500
    ),
    bodyText2: GoogleFonts.inter(
      color: primaryLight,
      fontSize: 14.0,
    ),
    subtitle1: GoogleFonts.inter(
      color: whiteShadeColor,
      fontSize: 16.0,
    ),
    subtitle2: GoogleFonts.inter(
      color: accentLight,
      fontSize: 12.0,
    ),
    button: GoogleFonts.inter(
      color: backgroundLight,
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),
      caption: GoogleFonts.inter(
      color: backgroundLight,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
      overline: GoogleFonts.inter(
        color: homeWidgetColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
  ),
  );
}

/// Dark Mode
ThemeData themeDataDark(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
    primaryColor: primaryColor,
    errorColor: errorLight,
    primarySwatch: Colors.blue,
    hintColor: accentLight,
    cardColor: cardLightColor,
    brightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryLight,
    ),
    unselectedWidgetColor: unSelectedLight,
    scaffoldBackgroundColor: backgroundLight,
    backgroundColor: backgroundLight,
    iconTheme: IconThemeData(color: backgroundDark),
    primaryIconTheme: IconThemeData(color: backgroundDark),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    indicatorColor: primaryLight,
    buttonTheme: ButtonThemeData(
      minWidth: 120.0,
      height: 45.0,
      buttonColor: primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: selectedLight,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryLight,
        ),
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline1: GoogleFonts.inter(
        color: whiteShadeColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headline2: GoogleFonts.inter(
        color: primaryLight,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headline3: GoogleFonts.inter(
        color: primaryLight,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      headline4: GoogleFonts.inter(
        color: primaryLight,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: GoogleFonts.inter(
          color: accentDark,
          fontSize: 14.0,
          fontWeight: FontWeight.w400
      ),
      bodyText2: GoogleFonts.inter(
        color: primaryLight,
        fontSize: 14.0,
      ),
      subtitle1: GoogleFonts.inter(
        color: whiteShadeColor,
        fontSize: 16.0,
      ),
      subtitle2: GoogleFonts.inter(
        color: accentLight,
        fontSize: 12.0,
      ),
      button: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      caption: GoogleFonts.inter(
        color: backgroundLight,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
      overline: GoogleFonts.inter(
        color: homeWidgetColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
