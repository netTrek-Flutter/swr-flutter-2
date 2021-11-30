import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/samples/media_query_sample.dart';

import 'main/my_app.dart';
import 'samples/bloc_advanced_sample/post_bloc.dart';

void main() {
  setPreferredOrientations();

  var _pixelRatio = WidgetsBinding.instance?.window.devicePixelRatio ?? 1;
  var _screenWidth = WidgetsBinding.instance?.window.physicalSize.width ?? 400;
  var _screenHeight =
      WidgetsBinding.instance?.window.physicalSize.height ?? 800;
  var _textScaleFactor = WidgetsBinding.instance?.window.textScaleFactor ?? 1;

  var _width = _screenWidth / _pixelRatio;
  var _height = _screenHeight / _pixelRatio;

  // print(
  //     '$_width x $_height - pixelRatio:= $_pixelRatio textScaleFactor:= $_textScaleFactor');

  runApp(
    BlocProvider(
      create: (context) => /*PostCubit()*/ PostBloc(),
      child: MyApp(
        size: Size(_width, _height),
        pixelRatio: _pixelRatio,
        textScaleFactor: _textScaleFactor,
        // bitte bodies nicht mehr nutzen sind jetzt im Drawer
        // body: ListViewSample(),
        // body: GridViewSample(),
        // body: GridViewSampleWithPAgeView(),
        // body: SliverViewSample(),
        // body: const StatefullSample(),
        // body: const ListViewStatefullSample(
        //   selected: 2,
        // ),
        // body: const UseBlocSample(),
        // body: const ListViewWithBlocBuilderSample(),
        // body: const BlocBuilder4CubitSample(),
        // body: const GestureSample(),
        // body: const AnimiereContainer(defaultSize: 10),
        // body: const AnimationCtrlSample(),
        // body: const NavigationSampleSimple(),
      ),
    ),
  );
}
