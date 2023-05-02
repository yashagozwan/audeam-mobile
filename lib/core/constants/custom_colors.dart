import 'package:flutter/material.dart';

class CustomColors {
  static MaterialColor _getMaterialColor(int colorValue) {
    Color color = Color(colorValue);
    Map<int, Color> shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900]
        .asMap()
        .map((key, value) =>
            MapEntry(value, color.withOpacity(1 - (1 - (key + 1) / 10))));

    return MaterialColor(colorValue, shades);
  }

  static final primary = _getMaterialColor(0xFF000000);
}
