import 'package:flutter/material.dart';

class AppStyle {
  static const borderRadius = BorderRadius.all(Radius.circular(8));

  static final inputTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade200,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: const OutlineInputBorder(
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
