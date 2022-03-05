import 'package:bloc_template/core/services/shared_pref_service.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? themeData;

  ThemeProvider(this.themeData);

  ThemeData? getTheme() => themeData;

  Future<void> setTheme(AppThemeMode mode) async {
    themeData = AppTheme.mapTheme[mode];
    await SharedPrefService().setTheme(mode);
    notifyListeners();
  }
}
