import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.teal,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.orange),
  );
}
