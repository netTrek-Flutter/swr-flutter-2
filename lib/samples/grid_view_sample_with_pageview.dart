import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/rest/post_service.dart';

class GridViewSampleWithPAgeView extends StatelessWidget {
  const GridViewSampleWithPAgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
        future: PostService('https://jsonplaceholder.typicode.com/posts')
            .getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildErrorText(snapshot, context);
          } else if (snapshot.hasData) {
            return _buildGridViews(snapshot.data!);
          }
          return const CircularProgressIndicator();
        });
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

  Widget _buildGridViews(List<PostModel> persons) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) =>
              _buildGridTileFromPost(persons[index]),
          itemCount: persons.length,
        ),
        GridView.count(
          crossAxisCount: 3,
          children:
              persons.map((post) => _buildGridTileFromPost(post)).toList(),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) =>
              _buildGridTileFromPost(persons[index]),
          itemCount: persons.length,
        ),
        GridView.custom(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => _buildGridTileFromPost(persons[index]),
              childCount: persons.length),
        ),
      ],
    );
  }

  Widget _buildFromColor(PostModel post, Color color) {
    return AspectRatio(
      aspectRatio: 1,
      child: ColoredBox(
        color: color,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            '${post.title}',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildGridTileFromPost(PostModel post) {
    switch (post.id! % 8) {
      case 0:
        return _buildFromColor(post, Colors.deepPurple);
      case 1:
        return _buildFromColor(post, Colors.amber);
      case 2:
        return _buildFromColor(post, Colors.blue);
      case 3:
        return _buildFromColor(post, Colors.red);
      case 4:
        return _buildFromColor(post, Colors.green);
      case 5:
        return _buildFromColor(post, Colors.teal);
      case 6:
        return _buildFromColor(post, Colors.cyan);
      case 7:
        return _buildFromColor(post, Colors.orange);
    }
    throw Error();
  }
}
