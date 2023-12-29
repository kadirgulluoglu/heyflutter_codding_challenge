import 'package:flutter/material.dart';
import 'package:heyflutter_codding_challenge/core/theme/app_theme.dart';

import 'light_color_scheme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();

  LightColorsScheme? colorsScheme = LightColorsScheme.instance;

  @override
  ThemeData? get theme => ThemeData.light().copyWith(
        colorScheme: _colorScheme,
        brightness: Brightness.light,
        scaffoldBackgroundColor: colorsScheme?.backgroundColor,
        bottomNavigationBarTheme: bottomNavigationBarThemeData(),
      );

  BottomNavigationBarThemeData bottomNavigationBarThemeData() {
    return BottomNavigationBarThemeData(
      selectedItemColor: colorsScheme?.primaryColor,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    );
  }

  ColorScheme get _colorScheme => ThemeData.light().colorScheme.copyWith(
        background: colorsScheme?.backgroundColor,
        primary: colorsScheme?.primaryColor,
        secondary: colorsScheme?.secondaryColor,
        surfaceTint: Colors.blue,
      );
}
