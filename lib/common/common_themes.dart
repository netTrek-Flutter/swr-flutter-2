import 'dart:math';

import 'package:flutter/material.dart';

final ThemeData lightVariant = ThemeData.from(
  colorScheme: const ColorScheme.light(
    primary: Colors.amber,
    secondary: Colors.orange,
    onPrimary: Colors.black,
    // background: Colors.grey,
  ),
);

final ThemeData lightVariantWithTextStyles = ThemeData.from(
  colorScheme: const ColorScheme.light(
    primary: Colors.amber,
    secondary: Colors.orange,
    onPrimary: Colors.black,
    // background: Colors.grey,
  ),
  textTheme: const TextTheme(
      bodyText2: TextStyle(
    color: Colors.green,
  )),
);

final ThemeData myTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.amber,
    secondary: Colors.orange,
    onPrimary: Colors.black,
    // background: Colors.grey,
  ),
  fontFamily: 'Monospace',
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: Colors.green,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orange.shade700, // dunkler
    foregroundColor:
        Colors.white, // Farbe mit der auf den Hintergrund gezeichnet wird
    splashColor: Colors.red.shade100, // Farbeffekt beim Tappen
    extendedTextStyle: const TextStyle(
      // farbe eines Labels - falls benutz
      color: Colors.white,
    ),
  ),
);

final ThemeData myThemeWithButton = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Colors.amber,
    secondary: Colors.orange,
    onPrimary: Colors.black,
    // background: Colors.grey,
  ),
  fontFamily: 'Monospace',
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.green, fontSize: 22),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.purple),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orange.shade700, // dunkler
    foregroundColor:
        Colors.white, // Farbe mit der auf den Hintergrund gezeichnet wird
    splashColor: Colors.red.shade100, // Farbeffekt beim Tappen
    extendedTextStyle: const TextStyle(
      // farbe eines Labels - falls benutz
      color: Colors.white,
    ),
  ),
);

ThemeData getTheme(Size size) {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.amber,
      secondary: Colors.orange,
      onPrimary: Colors.black,
      // background: Colors.grey,
    ),
    fontFamily: 'Monospace',
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.green,
        fontSize: 14 * (min(size.width, size.height) / 392.7),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.purple),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.orange.shade700, // dunkler
      foregroundColor:
          Colors.white, // Farbe mit der auf den Hintergrund gezeichnet wird
      splashColor: Colors.red.shade100, // Farbeffekt beim Tappen
      extendedTextStyle: const TextStyle(
        // farbe eines Labels - falls benutz
        color: Colors.white,
      ),
    ),
  );
}
