import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  final primarySwatch = generateSwatchColor(
    const Color.fromRGBO(66, 66, 66, 1.0),
  );
  final secondarySwatch = generateSwatchColor(
    const Color.fromRGBO(111, 191, 68, 1.0),
    //const Color.fromRGBO(26, 35, 126, 1.0),
  );
  final supportSwatch = generateSwatchColor(
    const Color.fromRGBO(245, 127, 23, 1.0),
  );
}

MaterialColor generateSwatchColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.5),
    100: tintColor(color, 0.4),
    200: tintColor(color, 0.3),
    300: tintColor(color, 0.2),
    400: tintColor(color, 0.1),
    500: tintColor(color, 0),
    600: tintColor(color, -0.1),
    700: tintColor(color, -0.2),
    800: tintColor(color, -0.3),
    900: tintColor(color, -0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);
