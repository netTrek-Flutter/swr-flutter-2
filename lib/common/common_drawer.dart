import 'package:flutter/material.dart';
import 'package:training/main/my_home.dart';
import 'package:training/samples/animation_ctrl_sample.dart';
import 'package:training/samples/animation_sample.dart';
import 'package:training/samples/button_sample.dart';
import 'package:training/samples/center_sample.dart';
import 'package:training/samples/column_sample.dart';
import 'package:training/samples/column_sample_advanced.dart';
import 'package:training/samples/container_sample.dart';
import 'package:training/samples/custom_painter_sample.dart';
import 'package:training/samples/draw_sample.dart';
import 'package:training/samples/future_builder_sample.dart';
import 'package:training/samples/gesture_sample.dart';
import 'package:training/samples/gradient_magic_sample.dart';
import 'package:training/samples/icons_sample.dart';
import 'package:training/samples/image_sample.dart';
import 'package:training/samples/media_query_sample.dart';
import 'package:training/samples/my_inherited_sample.dart';
import 'package:training/samples/stack_sample.dart';
import 'package:training/samples/svg_sample.dart';
import 'package:training/samples/text_sample.dart';
import 'package:training/samples/transform_sample.dart';

Drawer buildDrawer(BuildContext context, Widget widget) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const SizedBox(
          height: 90,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Text('Beispiele'),
          ),
        ),
        _buildListTile(
            widget, context, widget is CenterSample, const CenterSample()),
        _buildListTile(widget, context, widget is ContainerSample,
            const ContainerSample()),
        _buildListTile(widget, context, widget is GradientMagicSample,
            const GradientMagicSample()),
        _buildListTile(
            widget, context, widget is ColumnSample, const ColumnSample()),
        _buildListTile(widget, context, widget is ColumnSampleAdvanced,
            const ColumnSampleAdvanced()),
        _buildListTile(
            widget, context, widget is TextSample, const TextSample()),
        _buildListTile(
            widget, context, widget is IconSample, const IconSample()),
        _buildListTile(
            widget, context, widget is ButtonSample, const ButtonSample()),
        _buildListTile(
            widget, context, widget is ImageSample, const ImageSample()),
        _buildListTile(widget, context, widget is SvgSample, const SvgSample()),
        _buildListTile(
            widget, context, widget is DrawSample, const DrawSample()),
        _buildListTile(widget, context, widget is CustomPainterSample,
            const CustomPainterSample()),
        _buildListTile(widget, context, widget is TransformSample,
            const TransformSample()),
        _buildListTile(
            widget, context, widget is StackSample, const StackSample()),
        _buildListTile(widget, context, widget is MediaQuerySample,
            const MediaQuerySample()),
        _buildListTile(widget, context, widget is OrientationBuilderSample,
            const OrientationBuilderSample()),
        _buildListTile(widget, context, widget is MyInheritedSample,
            const MyInheritedSample()),
        _buildListTile(widget, context, widget is FutureBuilderSample,
            const FutureBuilderSample()),
        _buildListTile(
            widget, context, widget is GestureSample, const GestureSample()),
        _buildListTile(widget, context, widget is AnimationCtrlSample,
            const AnimationCtrlSample()),
        _buildListTile(
            widget,
            context,
            widget is AnimiereContainer,
            const AnimiereContainer(
              defaultSize: 15,
            )),
      ],
    ),
  );
}

ListTile _buildListTile(
    Widget widget, BuildContext context, bool isSelected, Widget body) {
  return ListTile(
    title: Text(body.runtimeType.toString()),
    selected: isSelected,
    onTap: isSelected == false
        ? () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHome(
                    body: body,
                    label: body.runtimeType.toString(),
                  ),
                ));
          }
        : null,
  );
}
