import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/common/common_bottom_nav_bar.dart';
import 'package:training/common/factories.dart';
import 'package:training/main/my_app.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
import 'package:training/samples/bloc_sample/list_view_with_bloc_builder_sample.dart';
import 'package:training/samples/bloc_sample/post_bloc.dart';
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
    if (widget.body is ListViewWithBlocBuilderSample) {
      _observeState2OpenDetails(bloc, context);
    }
    // Navigator.of(context).
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        // log('** ${state.selected?.title ?? widget.label} $state');
        return Scaffold(
          appBar: buildAppBar(state, widget.body),
          body: widget.body,
          floatingActionButton: _buildFloatingActionButton(bloc),
          bottomNavigationBar: CommonBottomNavBar(widget.body),
        );
      },
    );
  }

  AppBar buildAppBar(PostState state, Widget body) {
    Widget? icon;
    //
    // icon = isListView(body) ? const Icon(Icons.format_list_bulleted) : null;
    // icon ??= isGridView(body) ? const Icon(Icons.grid_on) : null;
    // icon ??= isImageView(body) ? const Icon(Icons.image) : null;
    //
    Widget text = _buildAppBarText(state, widget.body is PostDetailView);
    Widget title = icon == null
        ? text
        : Row(
            children: [
              icon,
              text,
            ],
          );

    return AppBar(
      title: title,
    );
  }

  Text _buildAppBarText(PostState state, bool isDetailView) => buildText(
      isDetailView ? state.selected?.title ?? widget.label : widget.label);

  Row? _buildFloatingActionButton(PostBloc bloc) {
    return isListView(widget.body)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'fBTNdownward',
                onPressed: () => bloc.add(PostNextEvent()),
                child: const Icon(Icons.arrow_downward),
              ),
              const SizedBox(
                width: 5,
              ),
              FloatingActionButton(
                heroTag: 'fBTNupward',
                onPressed: () => bloc.add(PostPrevEvent()),
                child: const Icon(Icons.arrow_upward),
              ),
            ],
          )
        : null;
  }

  void _observeState2OpenDetails(PostBloc bloc, BuildContext context) {
    // log('handle subscription $context ${widget.body}');
    subscription ??= bloc.stream
        .where((state) =>
            (state is PostSelected /* || state is PostNoSelection*/) &&
            selected != state.selected)
        .listen((state) async {
      selected = state.selected;
      // subscription?.cancel();
      // log('open');
      final response = await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MyHome(body: const PostDetailView());
        },
      ));
      // log('closed $response');
      Navigator.popUntil(context, (route) {
        // log(route.toString());
        return route.settings.name == page_list;
      });
      bloc.add(const PostSelectEvent(selected: null));
    });
  }
}
