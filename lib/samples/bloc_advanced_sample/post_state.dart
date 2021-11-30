part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  abstract final PostModel? selected;
  abstract final List<PostModel>? posts;
  abstract final Object? error;

  const PostState();

  @override
  List<Object?> get props => [error, posts, selected];

  @override
  String toString() {
    return '$runtimeType{selected: $selected, posts: $posts, error: $error}';
  }
}

class PostInitial extends PostState {
  const PostInitial();

  @override
  List<PostModel>? get posts => null;

  @override
  PostModel? get selected => null;

  @override
  Object? get error => null;
}

class PostLoadPosts extends PostInitial {}

class PostLoaded extends PostInitial {
  final List<PostModel> _posts;

  const PostLoaded({required List<PostModel> posts}) : _posts = posts;

  @override
  List<PostModel>? get posts => _posts;

  @override
  List<Object?> get props => [error, posts, selected];
}

class PostLoadError extends PostInitial {
  final Object _error;

  const PostLoadError({required Object error}) : _error = error;

  @override
  Object get error => _error;

  @override
  List<Object?> get props => [error, posts, selected];
}

class PostNoSelection extends PostLoaded {
  const PostNoSelection({required List<PostModel> posts}) : super(posts: posts);

  @override
  List<Object?> get props => [error, posts, selected];
}

class PostSelected extends PostNoSelection {
  final PostModel _selected;

  const PostSelected(
      {required PostModel selected, required List<PostModel> posts})
      : _selected = selected,
        super(posts: posts);

  @override
  PostModel get selected => _selected;

  @override
  List<Object?> get props => [error, posts, selected];
}
