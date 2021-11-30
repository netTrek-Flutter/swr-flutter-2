import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/common/common_bottom_nav_bar.dart';
import 'package:training/common/factories.dart';
import 'package:training/main/my_app.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
import 'package:training/samples/bloc_sample/post_bloc.dart';
// import 'package:training/samples/cubit_sample/post_cubit.dart';

class MyHome extends StatelessWidget {
  final String label;
  final Widget body;

  const MyHome({
    Key? key,
    this.label = 'app title',
    required this.body,
  }) : super(key: key);

  // für Bloc
  @override
  Widget build(BuildContext context) {
    PostBloc bloc = BlocProvider.of<PostBloc>(context);
    return BlocBuilder<PostBloc, PostState>(
      // buildWhen: (prev, next) {
      //   log('prev ${prev}');
      //   log('next ${next}');
      //   log((prev != next).toString());
      //   return prev != next;
      // },
      builder: (context, state) {
        log('** $state');
        return Scaffold(
          appBar: AppBar(
            title: buildText(label),
          ),
          body: body,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'fBTNdownward',
                onPressed: null, //() => bloc.add(PostNextEvent()),
                child: const Icon(Icons.arrow_downward),
              ),
              const SizedBox(
                width: 5,
              ),
              FloatingActionButton(
                heroTag: 'fBTNupward',
                onPressed: () => null, //bloc.add(PostPrevEvent()),
                child: const Icon(Icons.arrow_upward),
              ),
            ],
          ),
          bottomNavigationBar: CommonBottomNavBar(),
        );
      },
    );
  }
/*
  @override
  Widget builds(BuildContext context) {
    PostCubit cubit = BlocProvider.of<PostCubit>(context);
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: buildText('$label - ${state.selected}'),
          ),
          body: body,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'saban',
                onPressed: () => cubit.prev(),
                child: const Icon(Icons.arrow_downward),
              ),
              const SizedBox(
                width: 5,
              ),
              FloatingActionButton(
                heroTag: 'nik',
                onPressed: () => cubit.next(),
                child: const Icon(Icons.arrow_upward),
              ),
            ],
          ),
          bottomNavigationBar:
              CommonBottomNavBar(currentIndex: pages.indexOf(label)),
        );
      },
    );
  }
  */
}
