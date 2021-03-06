import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:training/main/my_home.dart';
import 'package:training/samples/bloc_sample/list_view_with_bloc_builder_sample.dart';
import 'package:training/samples/navigation/post_detail_view.dart';

import '../grid_view_sample_with_pageview.dart';
import '../image_with_border.dart';

const String page_list = 'list';
const String page_grid = 'grid';
const String page_image = 'image';

const pages = [page_list, page_grid, page_image];

bool isListView(Widget widget) =>
    widget is ListViewWithBlocBuilderSample || widget is PostDetailView;

bool isGridView(Widget widget) => widget is GridViewSampleWithPAgeView;

bool isImageView(Widget widget) => widget is ImageWithBorder;

Map<String, WidgetBuilder> routes2 = {
  page_list: (context) {
    // log('builder 4 pageRoute');
    return MyHome(
        label: page_list, body: const ListViewWithBlocBuilderSample());
  },
  page_grid: (context) {
    return MyHome(
      label: page_grid,
      body: const GridViewSampleWithPAgeView(),
    );
  },
  page_image: (context) {
    return MyHome(
      label: page_image,
      body: const ImageWithBorder(),
    );
  },
};

Map<String, MaterialPageRoute> routes = {
  page_list: MaterialPageRoute(
    builder: (context) {
      return MyHome(
          label: page_list, body: const ListViewWithBlocBuilderSample());
    },
  ),
  page_grid: MaterialPageRoute(
    builder: (context) {
      return MyHome(
        label: page_grid,
        body: const GridViewSampleWithPAgeView(),
      );
    },
  ),
  page_image: MaterialPageRoute(
    builder: (context) {
      return MyHome(
        label: page_image,
        body: const ImageWithBorder(),
      );
    },
  )
};
