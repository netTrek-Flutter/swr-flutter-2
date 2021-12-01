import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/main/my_home.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/rest/post_service.dart';
import 'package:training/samples/bloc_advanced_sample/post_bloc.dart';
import 'package:training/samples/navigation/post_detail_view.dart';
// import 'package:training/samples/bloc_sample/post_bloc.dart';
// import 'package:training/samples/navigation/post_detail_view.dart';

class ListViewWithBlocBuilderSample extends StatelessWidget {
  const ListViewWithBlocBuilderSample({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    PostBloc bloc = BlocProvider.of<PostBloc>(context);
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        // print('${state}'); - doppelter Lauf entsteht wegen IDE/SDK "BUG"
        // flutter run - startet das ganze wirklich einmal
        // das Flutter Team sieht das nicht als kritisch, weil rerendering
        // Konstate werde eh verwirft und im Release Build sowas nicht passiert
        if (state is PostInitial && state.posts == null) {
          // log('trigger load ${state.hashCode}');
          bloc.add(PostLoadEvent());
          // } else if (state is PostSelected) {
          //   log('open');
          //   _openDetailView(state.selected /*, bloc*/, context);
        } else if (state is PostSelected ||
            state is PostNoSelection ||
            state is PostLoaded) {
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
