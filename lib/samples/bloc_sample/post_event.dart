part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostNextEvent extends PostEvent {}

class PostPrevEvent extends PostEvent {}

class PostSetEvent extends PostEvent {
  final int selected;

  PostSetEvent(this.selected);
}

class PostSetTitleAndIdEvent extends PostEvent {
  final int selected;
  final String title;

  PostSetTitleAndIdEvent(this.selected, this.title);
}
