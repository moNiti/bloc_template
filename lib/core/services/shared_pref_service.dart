import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import '../utility/extension.dart';
import '../config/config.dart';

class SharedPrefService {
  static final SharedPrefService _sharedPrefService =
      SharedPrefService._internal();
  SharedPrefService._internal();
  factory SharedPrefService() => _sharedPrefService;

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Config.tokenKey);
    if (token.isNullOrEmpty()) {
      return null;
    }
    return token;
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Config.tokenKey, token);
  }

  Future<ThemeData?> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? mode = prefs.getString(Config.themeKey);

    if (mode.isNullOrEmpty()) {
      return null;
    }
    return AppTheme.mapTheme[
        AppThemeMode.values.firstWhere((element) => element.name == mode)];
  }

  Future<void> setTheme(AppThemeMode mode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Config.themeKey, mode.name);
  }
}
