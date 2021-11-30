import 'package:flutter/material.dart';
import 'package:training/main/my_home.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
import 'package:training/samples/navigation/post_detail_view.dart';

import 'factories.dart';

AppBar buildAppBar(PostState state, MyHome widget, BuildContext context) {
  final router = ModalRoute.of(context);

  Widget text = _buildAppBarText(state, widget.body is PostDetailView, widget);
  Widget? leading = router?.canPop == true
      ? IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back))
      : null;

  return AppBar(
    automaticallyImplyLeading: false,
    leading: leading,
    title: text,
  );
}

Text _buildAppBarText(PostState state, bool isDetailView, MyHome widget) =>
    buildText(
        isDetailView ? state.selected?.title ?? widget.label : widget.label);
