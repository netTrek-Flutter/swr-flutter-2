import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostSetSelected(selected: 1)) {
    on<PostNextEvent>((event, emit) {
      emit(PostSetSelected(
          selected: min(state.selected + 1,
              100))); // 100 weil das Testsystem nicht mehr hat
    });
    on<PostPrevEvent>((event, emit) {
      emit(PostSetSelected(
          selected: max(state.selected - 1,
              1))); // 100 weil das Testsystem nicht mehr hat
    });
    on<PostSetEvent>((event, emit) {
      emit(PostSetSelected(
          selected: event.selected)); // 100 weil das Testsystem nicht mehr hat
    });
  }
}
