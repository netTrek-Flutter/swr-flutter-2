import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/main/my_home.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
import 'package:training/samples/bloc_sample/post_bloc.dart';
import 'package:training/samples/cubit_sample/bloc_builder_4_cubit_sample.dart';
// import 'package:training/samples/cubit_sample/post_cubit.dart';
import 'package:training/samples/grid_view_sample.dart';
import 'package:training/samples/grid_view_sample_with_pageview.dart';
import 'package:training/samples/image_with_border.dart';
import 'package:training/samples/list_view_statefull_sample.dart';
import 'package:training/samples/navigation/navigation_sample.dart';
import 'package:training/samples/navigation/post_detail_view.dart';
import 'package:training/samples/navigation/routing.dart';

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

const page_list = 'list';
const page_grid = 'grid';
const page_image = 'image';

const pages = [page_list, page_grid, page_image];

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
    PostBloc bloc = BlocProvider.of<PostBloc>(context);
    return MaterialApp(
      theme: theme,
      routes: routes2,
      initialRoute: initialRoute,

      // onGenerateInitialRoutes: (initialRoute) => body,
      // onGenerateRoute: (settings) => routerMap[settings.name],
    );
  }
}
