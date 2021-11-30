part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  abstract final PostModel? selected;
  abstract final List<PostModel>? posts;
  abstract final Object? error;

  const PostState();

  @override
  List<Object?> get props => [runtimeType, error, posts, selected];

  @override
  String toString() {
    return '$runtimeType{selected: $selected, posts: $posts, error: $error}';
  }

  @override
  bool operator ==(Object other) {
    final isEqual = identical(this, other) ||
        super == other &&
            other is PostState &&
            runtimeType == other.runtimeType &&
            selected == other.selected &&
            posts == other.posts &&
            error == other.error;
    // log('isEqual $isEqual - ${runtimeType} # ${other.runtimeType}');
    return isEqual;
  }

  @override
  int get hashCode =>
      super.hashCode ^ selected.hashCode ^ posts.hashCode ^ error.hashCode;
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

class PostLoadingPosts extends PostState {
  const PostLoadingPosts();

  @override
  List<PostModel>? get posts => null;

  @override
  PostModel? get selected => null;

  @override
  Object? get error => null;
}

class PostLoaded extends PostState {
  final List<PostModel> _posts;

  const PostLoaded({required List<PostModel> posts}) : _posts = posts;

  @override
  List<PostModel>? get posts => _posts;

  // @override
  // List<Object?> get props => [error, posts, selected];

  @override
  PostModel? get selected => null;

  @override
  Object? get error => null;
}

class PostLoadError extends PostState {
  final Object _error;

  const PostLoadError({required Object error}) : _error = error;

  @override
  Object get error => _error;

  @override
  List<PostModel>? get posts => null;

  @override
  PostModel? get selected => null;

  // @override
  // List<Object?> get props => [error, posts, selected];
}

class PostNoSelection extends PostState {
  final List<PostModel> _posts;

  const PostNoSelection({required List<PostModel> posts}) : _posts = posts;

  // @override
  // List<Object?> get props => [error, posts, selected];

  @override
  Object? get error => null;

  @override
  List<PostModel>? get posts => _posts;

  @override
  PostModel? get selected => null;
}

class PostSelected extends PostState {
  final PostModel _selected;
  final List<PostModel> _posts;

  const PostSelected(
      {required PostModel selected, required List<PostModel> posts})
      : _selected = selected,
        _posts = posts;

  @override
  PostModel get selected => _selected;

  @override
  Object? get error => null;

  @override
  List<PostModel>? get posts => _posts;

  // @override
  // List<Object?> get props => [error, posts, selected];
}
