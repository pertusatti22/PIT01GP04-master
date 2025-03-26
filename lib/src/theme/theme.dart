import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData theme() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors().primarySwatch.shade900,
      primaryColorDark: AppColors().primarySwatch.shade500,
      scaffoldBackgroundColor: AppColors().primarySwatch.shade400,
      backgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        headline3: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        headline4: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        headline5: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        headline6: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
      ));
}
