import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        ScaffoldMessenger,
        SnackBar,
        SnackBarBehavior,
        Text;

extension CustomSnackbar on BuildContext {
  void snackBar(String title, {Color? color}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(title),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
      ),
    );
  }
}
