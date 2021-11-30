import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/main/my_home.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/rest/post_service.dart';
import 'package:training/samples/bloc_sample/post_bloc.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
/*
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    return BlocBuilder<PostBloc, PostState>(
      buildWhen: (prev, next) {
        print('1-prev ${prev}');
        print('1-next ${next}');
        return prev.selected != next.selected;
      },
      builder: (context, state) => FutureBuilder<PostModel>(
        future: PostService('https://jsonplaceholder.typicode.com/posts')
            .getPostById(state.selected),
        builder: (context, snapshot) {
          print('1 - rebuild');
          if (snapshot.hasError) {
            return _buildErrorText(snapshot, context);
          } else if (snapshot.hasData) {
            postBloc.add(PostSetTitleAndIdEvent(
                snapshot.data!.id!, snapshot.data!.title!));
            return BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
                return Text(snapshot.data!.toString());
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
    */
  }

  Text _buildErrorText(
      AsyncSnapshot<PostModel?> snapshot, BuildContext context) {
    print(snapshot.error);
    return Text(
      '${snapshot.error}',
      style: TextStyle(
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
