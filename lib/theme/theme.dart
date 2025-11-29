import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColorLight = Color(0X80E0E7FF);
const textColorLight = Color(0xff131313);
final scaffoldBackgroundColorLight = Colors.white;
const switchColorLight = Color(0xff73C0FC);
const listViewColorLight = Color(0X0D000000);

const primaryColorDark = Color(0x80E0E7FF);
const textColorDark = Colors.white;
final scaffoldBackgroundColorDark = Color(0xFF191919);
const switchColorDark = Color(0xff004884);
const listViewColorDark = Color(0x0DFFFFFF);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColorLight,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    onPrimary: Colors.white,
    surface: Colors.white,
    onSurface: textColorLight,
  ),
  scaffoldBackgroundColor: scaffoldBackgroundColorLight,
  cardColor: listViewColorLight,

  primaryIconTheme: const IconThemeData(color: textColorLight),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    bodyLarge: TextStyle(
      color: textColorLight,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 28 / 20,
      letterSpacing: 0,
    ),
    bodyMedium: const TextStyle(
      color: textColorLight,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 28 / 16,
      letterSpacing: 0,
    ),
    bodySmall: const TextStyle(
      color: textColorLight,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColorDark,
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    onPrimary: Colors.black,
    surface: Color(0xFF191919),
    onSurface: textColorDark,
  ),
  scaffoldBackgroundColor: scaffoldBackgroundColorDark,
  cardColor: listViewColorDark,

  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    bodyLarge: TextStyle(
      color: textColorDark,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      height: 28 / 20,
      letterSpacing: 0,
    ),
    bodyMedium: TextStyle(
      color: textColorDark,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 28 / 16,
      letterSpacing: 0,
    ),
    bodySmall: TextStyle(
      color: textColorDark,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0,
    ),
  ),
);
