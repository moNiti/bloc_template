import 'package:flutter/material.dart';

import '../config/config.dart';

enum AppThemeMode { light, dark }

class AppTheme {
  static Map<AppThemeMode, ThemeData> mapTheme = {
    AppThemeMode.light: lightTheme,
    AppThemeMode.dark: darkTheme,
  };

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: Config.primaryColor,
        appBarTheme: AppBarTheme(backgroundColor: Config.primaryColor),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Config.primaryDarkColor,
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ));
  }
}
