import 'package:flutter/material.dart';

class LightColorsScheme {
  static LightColorsScheme? _instance;

  static LightColorsScheme? get instance =>
      _instance ??= LightColorsScheme._init();

  LightColorsScheme._init();

  final Color backgroundColor = const Color(0xffF6F7F9);
  final Color primaryColor = const Color(0xff38B4BC);
  final Color secondaryColor = const Color(0xfff3a817);
}
