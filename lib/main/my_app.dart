import 'package:flutter/material.dart';
import 'package:training/main/my_home.dart';

class MyApp extends StatelessWidget {
  final Widget body;
  const MyApp({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ),
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
