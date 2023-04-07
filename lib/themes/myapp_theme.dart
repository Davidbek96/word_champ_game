// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyAppTheme {
  ThemeData themeData() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF1F1147),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Color(0xFF6949FE)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.white38,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          backgroundColor: const Color(0xFF6949FE),
          foregroundColor: Colors.white70,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
      textTheme: TextTheme(
        headline1:
            TextStyle(color: Colors.white70, overflow: TextOverflow.ellipsis),
        headline2:
            TextStyle(color: Colors.white70, overflow: TextOverflow.ellipsis),
        bodyText2:
            TextStyle(color: Colors.white70, overflow: TextOverflow.ellipsis),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF6949FE),
        ),
      ),
    );
  }
}
