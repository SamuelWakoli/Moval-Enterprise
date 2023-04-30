import 'package:flutter/material.dart';

var primaryColor = const Color(0xFF117E00);
var primaryColorDark = const Color(0xFF44FF00);

var lightThemeData = ThemeData(
  primaryColor: primaryColor,
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  indicatorColor: primaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(surfaceTintColor: primaryColor),
  cardTheme: CardTheme(
    elevation: 0.5,
    shadowColor: primaryColor,
    surfaceTintColor: primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor)),
  ),
  drawerTheme: DrawerThemeData(surfaceTintColor: primaryColor),
  popupMenuTheme: PopupMenuThemeData(surfaceTintColor: primaryColor),
  dialogTheme: DialogTheme(surfaceTintColor: primaryColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      surfaceTintColor: MaterialStateProperty.resolveWith((states) {
        return primaryColor;
      }),
      textStyle: MaterialStateProperty.resolveWith((states) {
        return TextStyle(color: primaryColor);
      }),
    ),
  ),
);

var darkThemeData = ThemeData(
  primaryColor: primaryColorDark,
  useMaterial3: true,
  brightness: Brightness.dark,
  indicatorColor: primaryColorDark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(surfaceTintColor: primaryColorDark),
  cardTheme: CardTheme(
    elevation: 0.5,
    shadowColor: primaryColorDark,
    surfaceTintColor: primaryColorDark,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColorDark)),
  ),
  drawerTheme: DrawerThemeData(surfaceTintColor: primaryColorDark),
  popupMenuTheme: PopupMenuThemeData(surfaceTintColor: primaryColorDark),
  dialogTheme: DialogTheme(surfaceTintColor: primaryColorDark),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      surfaceTintColor: MaterialStateProperty.resolveWith((states) {
        return primaryColorDark;
      }),
      textStyle: MaterialStateProperty.resolveWith((states) {
        return TextStyle(color: primaryColorDark);
      }),
    ),
  ),
);
