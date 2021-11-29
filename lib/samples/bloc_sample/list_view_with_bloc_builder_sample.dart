import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/main/my_home.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/rest/post_service.dart';
import 'package:training/samples/bloc_sample/post_bloc.dart';
import 'package:training/samples/navigation/post_detail_view.dart';

class ListViewWithBlocBuilderSample extends StatelessWidget {
  const ListViewWithBlocBuilderSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
      future:
          PostService('https://jsonplaceholder.typicode.com/posts').getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _buildErrorText(snapshot, context);
        } else if (snapshot.hasData) {
          return BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
              return _buildListViews(snapshot.data!, state.selected, postBloc,
                  context: context);
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Text _buildErrorText(
      AsyncSnapshot<List<PostModel>?> snapshot, BuildContext context) {
    print(snapshot.error);
    return Text(
      '${snapshot.error}',
      style: TextStyle(
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }

  Widget _buildListViews(List<PostModel> posts, int selected, PostBloc postBloc,
      {required BuildContext context}) {
    return ListView.builder(
      itemBuilder: (context, index) => _buildListTileFromPost(posts[index],
          isSelected: posts[index].id == selected,
          postBloc: postBloc,
          context: context),
      itemCount: posts.length,
    );
  }

  _openDetailView(PostModel post, PostBloc postBloc, BuildContext context) {
    postBloc.add(PostSetTitleAndIdEvent(post.id!, post.title!));
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return MyHome(label: post.title!, body: const PostDetailView());
      },
    ));
  }

  Widget _buildListTileFromPost(
    PostModel post, {
    bool isSelected = false,
    required PostBloc postBloc,
    required BuildContext context,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      selected: isSelected,
      onTap: () => isSelected
          ? postBloc.add(PostSetEvent(0))
          : _openDetailView(post, postBloc, context),
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
