import 'package:flutter/material.dart';
import 'package:training/main/my_home.dart';

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

class MyApp extends StatelessWidget {
  final Widget body;
  const MyApp({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: myTheme,
      // darkTheme: ThemeData.from(
      //   colorScheme: const ColorScheme.dark(),
      // ),
      // themeMode: ThemeMode.system, // default
      // themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      home: MyHome(
        body: body,
      ),
    );
  }
}
