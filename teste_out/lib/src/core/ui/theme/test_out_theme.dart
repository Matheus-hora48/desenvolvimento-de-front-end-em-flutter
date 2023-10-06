import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

sealed class TestOutTheme {
  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
    borderSide: BorderSide(
      color: ColorsConstants.borderColor,
    ),
  );

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsConstants.blue),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: ColorsConstants.appBarTextColor,
        fontFamily: FontsConstants.fontFamily,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isCollapsed: true,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      fillColor: Colors.white,
      labelStyle: const TextStyle(
        color: ColorsConstants.borderColor,
      ),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(
          color: ColorsConstants.errorColor,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: ColorsConstants.blue,
          width: 1,
        ),
        textStyle: const TextStyle(color: ColorsConstants.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Color(0xFF1A1C1E),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodyMedium: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Color(0xFF1A1C1E),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      titleMedium: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Color(0xFF1A1C1E),
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
