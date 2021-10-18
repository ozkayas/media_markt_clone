import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData mainTheme() => ThemeData(
        fontFamily: 'MM',
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 2,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey),
        textTheme: mainTextTheme,
      );

  static TextTheme mainTextTheme = TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: Colors.red,
    ),
  );
}
