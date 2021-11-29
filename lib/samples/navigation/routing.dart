import 'package:flutter/material.dart';
import 'package:training/main/my_app.dart';
import 'package:training/main/my_home.dart';
import 'package:training/samples/bloc_sample/list_view_with_bloc_builder_sample.dart';

import '../grid_view_sample_with_pageview.dart';
import '../image_with_border.dart';
import '../list_view_statefull_sample.dart';

MaterialPageRoute? generateRoute(RouteSettings settings) {
  print(settings);
  switch (settings.name) {
    case page_list:
      return MaterialPageRoute(
        builder: (context) {
          return MyHome(
              label: settings.name!,
              body: const ListViewWithBlocBuilderSample(
                  // selected: int.tryParse(settings.arguments.toString()),
                  ));
        },
      );
    case page_grid:
      return MaterialPageRoute(
        builder: (context) {
          return MyHome(
              label: settings.name!, body: const GridViewSampleWithPAgeView());
        },
      );
    case page_image:
      return MaterialPageRoute(
        builder: (context) {
          return MyHome(label: settings.name!, body: const ImageWithBorder());
        },
      );
  }
  return null;
}
