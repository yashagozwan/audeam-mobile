import 'package:audeam_mobile/core/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get light {
    ThemeData themeData = ThemeData(
      primarySwatch: CustomColors.primary,
      fontFamily: 'Inter',
    );

    final cardTheme = themeData.cardTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    final elevatedButton = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );

    final outlinedButton = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: CustomColors.primary),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );

    final snackBarTheme = themeData.snackBarTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return themeData.copyWith(
      scaffoldBackgroundColor: Colors.grey.shade50,
      elevatedButtonTheme: elevatedButton,
      cardTheme: cardTheme,
      outlinedButtonTheme: outlinedButton,
      snackBarTheme: snackBarTheme,
    );
  }
}
