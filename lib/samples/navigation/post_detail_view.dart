import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/main/my_home.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/rest/post_service.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
import 'package:training/samples/bloc_sample/post_bloc.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      buildWhen: (previous, current) => current.selected != null,
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.all(16),
          tileColor:
              state.selected!.id! % 2 == 0 ? Colors.teal.shade700 : Colors.teal,
          subtitle: Text(
            state.selected!.body!,
          ),
          title: Text(
            state.selected!.title!,
          ),
          // trailing: Icon(Icons.adaptive.more_outlined),
        );
        ;
      },
    );
  }
}
