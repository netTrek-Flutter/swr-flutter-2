import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';
/*

class _PostBloc extends Bloc<PostEvent, PostState> {
  _PostBloc() : super(PostSetSelected(selected: 0)) {
    on<PostNextEvent>((event, emit) {
      emit(PostSetSelected(
          selected: min(state.selected + 1,
              100))); // 100 weil das Testsystem nicht mehr hat
    });
    on<PostPrevEvent>((event, emit) {
      emit(PostSetSelected(
          selected: max(state.selected - 1,
              0))); // 100 weil das Testsystem nicht mehr hat
    });
    on<PostSetEvent>((event, emit) {
      emit(PostSetSelected(
          selected: event.selected)); // 100 weil das Testsystem nicht mehr hat
    });
    on<PostSetTitleAndIdEvent>((event, emit) {
      emit(PostSetSelected(
          selected: event.selected, selectedTitle: event.title )); // 100 weil das Testsystem nicht mehr hat
    });
  }
}

*/
