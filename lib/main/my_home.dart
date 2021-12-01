import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/common/common_app_bar.dart';
import 'package:training/common/common_bottom_nav_bar.dart';
import 'package:training/common/common_drawer.dart';
import 'package:training/common/common_floation_action_button.dart';
import 'package:training/main/my_app.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
import 'package:training/samples/bloc_sample/list_view_with_bloc_builder_sample.dart';
import 'package:training/samples/navigation/post_detail_view.dart';
import 'package:training/samples/navigation/routing.dart';
// import 'package:training/samples/cubit_sample/post_cubit.dart';

class MyHome extends StatefulWidget {
  final String label;
  final Widget body;

  MyHome({
    Key? key,
    this.label = 'app title',
    required this.body,
  }) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool once = false;

  StreamSubscription<PostState>? subscription;

  PostModel? selected;

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    PostBloc bloc = BlocProvider.of<PostBloc>(context);
    // print(bloc.state); // wenn es 2x läuft liegt es an IDE/SDK Kombi
    // flutter run im Terminal und es läuft wie erwartete
    if (widget.body is ListViewWithBlocBuilderSample) {
      _observeState2OpenDetails(bloc, context);
    }
    // Navigator.of(context).
    return Scaffold(
      appBar: buildAppBar(bloc.state, widget, context),
      body: widget.body,
      floatingActionButton: buildFloatingActionButton(bloc, widget),
      bottomNavigationBar: buildCommonBottomNavBar(widget.body),
      endDrawer: buildDrawer(context, widget.body),
    );
  }

  void _observeState2OpenDetails(PostBloc bloc, BuildContext context) {
    subscription ??= bloc.stream
        .where((state) => (state is PostSelected) && selected != state.selected)
        .listen((state) async {
      selected = state.selected;
      final response = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MyHome(body: const PostDetailView());
        },
      ));

      Navigator.popUntil(context, (route) {
        return route.settings.name == page_list;
      });

      bloc.add(const PostSelectEvent(selected: null));
    });
  }
}
