import 'package:alquran/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: mainColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      color: mainColor,
      foregroundColor: mainColor,
    ),
    iconTheme: const IconThemeData(color: blackColor),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: blackColor),
    colorScheme:
        const ColorScheme.light(primary: mainColor, secondary: orangeColor),
    buttonTheme: const ButtonThemeData(),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: mainColor,
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        color: mainColor,
        foregroundColor: white),
    iconTheme: const IconThemeData(color: white),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: white),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: mainColor,
      secondary: orangeColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: blackColor,
      selectedItemColor: mainColor,
      unselectedItemColor: greyColor,
      selectedIconTheme: IconThemeData(color: mainColor),
    ),
  );
}
