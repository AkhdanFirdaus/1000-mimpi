import 'package:flutter/material.dart';

class AppStyle {
  static const borderRadius = BorderRadius.all(Radius.circular(8));

  static const inputTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: borderRadius,
    ),
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
    ),
  );
}
