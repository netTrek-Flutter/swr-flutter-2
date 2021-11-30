import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:training/common/common_themes.dart';
import 'package:training/samples/navigation/routing.dart';

class MyApp extends StatefulWidget {
  final Widget? body;
  final Size size;
  final double pixelRatio;
  final double textScaleFactor;

  const MyApp({
    Key? key,
    this.body,
    required this.size,
    required this.pixelRatio,
    required this.textScaleFactor,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ThemeData theme;
  late final String initialRoute;
  late final Map<String, MaterialPageRoute> routerMap;
  late final Widget? body;

  @override
  void initState() {
    super.initState();
    body = widget.body;
    theme = getTheme(widget.size);
    initialRoute = page_list;
    routerMap = routes;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      routes: routes2,
      initialRoute: initialRoute,

      // onGenerateRoute: (settings) => routerMap[settings.name],
    );
  }
}
