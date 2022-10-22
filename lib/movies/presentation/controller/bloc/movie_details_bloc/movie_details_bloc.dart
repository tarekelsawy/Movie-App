// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';

import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_details.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_details_bloc/movie_details_state.dart';

part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsStates> {
  final UseCaseGetMovieDetails useCaseGetMovieDetails;
  MovieDetailsBloc({required this.useCaseGetMovieDetails})
      : super(MovieDetailsInitialState()) {
    on<OnGetMovieDetailsEvent>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(
      OnGetMovieDetailsEvent event, Emitter<MovieDetailsStates> emit) async {
    print('movie details in bloc');
    final result =
        await useCaseGetMovieDetails(MovieDetailsParameter(id: event.movieId));
    result.fold((failure) {
      print('error fold');
      emit(StateGetMovieDetails(
        message: failure.message,
        requestStates: RequestStates.error,
      ));
    }, (movieDetails) {
      log('success fold');
      log(movieDetails.toString());
      emit(
        StateGetMovieDetails(
          movieDetails: movieDetails,
          requestStates: RequestStates.success,
        ),
      );
    });
  }
}
