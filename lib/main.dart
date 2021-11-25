import 'package:flutter/material.dart';
import 'package:training/samples/button_sample.dart';
import 'package:training/samples/center_sample.dart';
import 'package:training/samples/column_sample.dart';
import 'package:training/samples/column_sample_advanced.dart';
import 'package:training/samples/container_sample.dart';
import 'package:training/samples/gradient_magic_sample.dart';
import 'package:training/samples/icons_sample.dart';
import 'package:training/samples/image_sample.dart';
import 'package:training/samples/image_with_border.dart';
import 'package:training/samples/svg_sample.dart';
import 'package:training/samples/text_sample.dart';

import 'main/my_app.dart';

void main() {
  runApp(const MyApp(
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
    body: SvgSample(),
  ));
}
