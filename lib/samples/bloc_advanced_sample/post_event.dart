part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostNextEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}

class PostPrevEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}

class PostSelectEvent extends PostEvent {
  final PostModel? selected;

  const PostSelectEvent({this.selected});

  @override
  List<Object?> get props => [selected];
}

class PostLoadEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}

class PostLoadedEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}

class PostLoadErrorEvent extends PostEvent {
  final Object error;

  const PostLoadErrorEvent({required this.error});

  @override
  List<Object?> get props => [error];
}
