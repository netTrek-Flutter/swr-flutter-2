import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:training/rest/post_model.dart';
import 'package:training/rest/post_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostInitial()) {
    // log('init Bloc');
    on<PostLoadEvent>(_postLoad);
    on<PostLoadingEvent>(_postLoading);
    on<PostLoadedEvent>(_postLoaded);
    on<PostLoadErrorEvent>(_postLoadError);
    on<PostSelectEvent>(_postSelect);
    on<PostNextEvent>(_selectNextPost);
    on<PostPrevEvent>(_selectPrevPost);
  }

  FutureOr<void> _postLoading(PostLoadingEvent event, Emitter<PostState> emit) {
    emit(const PostLoadingPosts());
  }

  FutureOr<void> _postLoad(PostLoadEvent event, Emitter<PostState> emit) async {
    add(PostLoadingEvent());
    try {
      final posts =
          await PostService('https://jsonplaceholder.typicode.com/posts')
              .getPosts();
      emit(PostLoaded(posts: posts));
      add(PostLoadedEvent());
    } catch (error) {
      add(PostLoadErrorEvent(error: error));
    }
  }

  FutureOr<void> _postSelect(PostSelectEvent event, Emitter<PostState> emit) {
    if (event.selected == null) {
      emit(PostNoSelection(posts: state.posts! /* [...state.posts!] */));
    } else {
      emit(PostSelected(
          posts: state.posts! /* [...state.posts!] */,
          selected: event.selected!));
    }
  }

  FutureOr<void> _postLoaded(PostLoadedEvent event, Emitter<PostState> emit) {
    add(const PostSelectEvent(selected: null));
  }

  FutureOr<void> _postLoadError(
      PostLoadErrorEvent event, Emitter<PostState> emit) {
    emit(PostLoadError(error: event.error));
  }

  FutureOr<void> _selectNextPost(PostNextEvent event, Emitter<PostState> emit) {
    _triggerSelection(emit, showNext: true);
  }

  FutureOr<void> _selectPrevPost(PostPrevEvent event, Emitter<PostState> emit) {
    _triggerSelection(emit, showPrev: true);
  }

  void _triggerSelection(Emitter<PostState> emit,
      {bool showNext = false, bool showPrev = false}) {
    // normieren falls ein Entwickler suboptimale Daten sendet.
    showNext = showNext == true ||
        (showNext == false && showPrev == false) ||
        (showNext == true && showPrev == true);
    if (state.selected != null) {
      final next = state.posts!.where((element) =>
          element.id == state.selected!.id! + (showNext == true ? 1 : -1));
      if (next.isNotEmpty) {
        emit(
          PostSelected(
            selected: next.first,
            posts: state.posts! /* [...state.posts!] */,
          ),
        );
      } else {
        emit(PostNoSelection(posts: state.posts! /* [...state.posts!] */));
      }
    } else {
      final selected = showNext ? state.posts!.first : state.posts!.last;
      emit(PostSelected(
          selected: selected, posts: state.posts! /* [...state.posts!] */));
    }
  }
}
