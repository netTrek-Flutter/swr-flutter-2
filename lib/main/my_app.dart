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

class MyApp extends StatelessWidget {
  final Widget body;
  const MyApp({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightVariant,
      darkTheme: ThemeData.from(
        colorScheme: const ColorScheme.dark(),
      ),
      // themeMode: ThemeMode.system, // default
      // themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      home: MyHome(
        body: body,
      ),
    );
  }
}
