import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/main/my_home.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/rest/post_service.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
// import 'package:training/samples/bloc_sample/post_bloc.dart';
// import 'package:training/samples/navigation/post_detail_view.dart';

class ListViewWithBlocBuilderSample extends StatefulWidget {
  const ListViewWithBlocBuilderSample({Key? key}) : super(key: key);

  @override
  _ListViewWithBlocBuilderSampleState createState() =>
      _ListViewWithBlocBuilderSampleState();
}

class _ListViewWithBlocBuilderSampleState
    extends State<ListViewWithBlocBuilderSample> {
  // PostModel? selected;
  // List<PostModel>? posts;
  //
  // _ListViewWithBlocBuilderSampleState({this.selected, this.posts});

  @override
  Widget build(BuildContext context) {
    PostBloc bloc = BlocProvider.of<PostBloc>(context);
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial && state.posts == null) {
          // bloc.add(PostLoadEvent());
        } else if (state is PostSelected ||
            state is PostNoSelection ||
            state is PostLoaded) {
          // setState(() {
          //   selected = state.selected;
          //   posts = state.posts;
          // });
          return _buildListViews(
            state.posts!,
            state.selected,
            bloc,
            context: context,
          );
        } else if (state is PostLoadError) {
          return _buildErrorText(state.error, context);
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Text _buildErrorText(Object error, BuildContext context) {
    return Text(
      '${error}',
      style: TextStyle(
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }

  Widget _buildListViews(
      List<PostModel> posts, PostModel? selected, PostBloc postBloc,
      {required BuildContext context}) {
    return ListView.builder(
      itemBuilder: (context, index) => _buildListTileFromPost(posts[index],
          isSelected: posts[index] == selected,
          postBloc: postBloc,
          context: context),
      itemCount: posts.length,
    );
  }

  // _openDetailView(PostModel post, PostBloc postBloc, BuildContext context) {
  //   postBloc.add(PostSetTitleAndIdEvent(post.id!, post.title!));
  //   Navigator.push(context, MaterialPageRoute(
  //     builder: (context) {
  //       return MyHome(label: post.title!, body: const PostDetailView());
  //     },
  //   ));
  // }

  Widget _buildListTileFromPost(
    PostModel post, {
    bool isSelected = false,
    required PostBloc postBloc,
    required BuildContext context,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      selected: isSelected,
      onTap: () =>
          postBloc.add(PostSelectEvent(selected: isSelected ? null : post)),
      tileColor: post.id! % 2 == 0 ? Colors.teal.shade700 : Colors.teal,
      selectedTileColor: Colors.tealAccent,
      subtitle: Text(
        post.body!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      title: Text(
        post.title!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(Icons.adaptive.share_outlined),
      // trailing: Icon(Icons.adaptive.more_outlined),
    );
  }
}
