import 'package:flutter/material.dart';
import 'package:training/main/my_home.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
import 'package:training/samples/navigation/routing.dart';

Row? buildFloatingActionButton(PostBloc bloc, MyHome widget) {
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
