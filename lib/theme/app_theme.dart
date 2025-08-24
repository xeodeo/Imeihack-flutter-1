import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData samsungTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color(0xFFC3A6E0),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xFFC3A6E0)),
    ),
    iconTheme: const IconThemeData(color: Color(0xFFC3A6E0)),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 38, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
      labelLarge: TextStyle(fontSize: 18, color: Colors.white),
    ),
  );
}
