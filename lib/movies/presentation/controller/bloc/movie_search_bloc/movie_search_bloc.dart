import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_search.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_search_bloc/movie_search_event.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_search_bloc/movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final UseCaseGetMovieSearch useCaseGetMovieSearch;
  MovieSearchBloc(this.useCaseGetMovieSearch) : super(MovieSearchState()) {
    on<OnEventGetMovieSearch>(_getMovieSearch);
  }

  static MovieSearchBloc get(BuildContext context) =>
      BlocProvider.of<MovieSearchBloc>(context);

  Future<void> _getMovieSearch(
      OnEventGetMovieSearch event, Emitter<MovieSearchState> emit) async {
    final result = await useCaseGetMovieSearch(
        MovieSearchParameter(searchQuery: event.searchQuery));
    result.fold((l) {
      emit(
        MovieSearchState().copyWith(
          message: l.message,
          requestStates: RequestStates.error,
        ),
      );
    }, (r) {
      print('fold success');
      emit(
        MovieSearchState().copyWith(
          movies: r,
          requestStates: RequestStates.success,
        ),
      );
    });
  }
}
