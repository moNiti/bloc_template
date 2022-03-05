import 'package:bloc_template/core/theme/app_theme.dart';
import 'package:bloc_template/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ThemeProvider>().setTheme(AppThemeMode.light);
            },
            child: Text("Light"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ThemeProvider>().setTheme(AppThemeMode.dark);
            },
            child: Text("Dark"),
          )
        ],
      ),
    );
  }
}
