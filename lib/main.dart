import 'package:flutter/material.dart';
import 'package:training/samples/button_sample.dart';
import 'package:training/samples/center_sample.dart';
import 'package:training/samples/column_sample.dart';
import 'package:training/samples/column_sample_advanced.dart';
import 'package:training/samples/container_sample.dart';
import 'package:training/samples/custom_painter_sample.dart';
import 'package:training/samples/draw_sample.dart';
import 'package:training/samples/future_builder_sample.dart';
import 'package:training/samples/gradient_magic_sample.dart';
import 'package:training/samples/grid_view_sample.dart';
import 'package:training/samples/grid_view_sample_with_pageview.dart';
import 'package:training/samples/icons_sample.dart';
import 'package:training/samples/image_sample.dart';
import 'package:training/samples/image_with_border.dart';
import 'package:training/samples/list_view_sample.dart';
import 'package:training/samples/media_query_sample.dart';
import 'package:training/samples/my_inherited_sample.dart';
import 'package:training/samples/sliver_view_sample.dart';
import 'package:training/samples/stack_sample.dart';
import 'package:training/samples/svg_sample.dart';
import 'package:training/samples/text_sample.dart';
import 'package:training/samples/transform_sample.dart';

import 'main/my_app.dart';

void main() {
  setPreferredOrientations();
  runApp(
    const MyApp(
      // body: CenterSample(),
      // body: ContainerSample(),
      // body: GradientMagicSample(),
      // body: ColumnSample(),
      // body: ColumnSampleAdvanced(),
      // body: TextSample(),
      // body: IconSample(),
      // body: ButtonSample(),
      // body: ImageSample(),
      // body: ImageWithBorder(),
      // body: SvgSample(),
      // body: DrawSample(),
      // body: CustomPainterSample(),
      // body: TransformSample(),
      // body: StackSample(),
      // body: MediaQuerySample()));
      // body: OrientationBuilderSample(),
      // body: MyInheritedSample(),
      // body: FutureBuilderSample(),
      // body: ListViewSample(),
      // body: GridViewSample(),
      // body: GridViewSampleWithPAgeView(),
      body: SliverViewSample(),
    ),
  );
}
