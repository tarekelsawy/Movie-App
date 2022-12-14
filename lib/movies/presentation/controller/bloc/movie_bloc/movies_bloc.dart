// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/core/utils/no_parameter_class.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_playing_now_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_popular_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_top_rated_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_events.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_states.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesStates> {
  final UseCaseGetPlayingNowMovies useCaseGetPlayingNowMovies;
  final UseCaseGetPopularMovies useCaseGetPopularMovies;
  final UseCaseGetTopRatedMovies useCaseGetTopRatedMovies;
  // final UseCaseGetMovieDetails useCaseGetMovieDetails;
  MovieBloc({
    required this.useCaseGetPlayingNowMovies,
    required this.useCaseGetPopularMovies,
    required this.useCaseGetTopRatedMovies,
    // required this.useCaseGetMovieDetails,
  }) : super(StateInitial()) {
    on<EventGetPlayingNowMovies>(_getPlayingNow);
    on<EventGetPopularMovies>(_getPopular);
    on<EventGetTopRatedMovies>(_getTopRated);
  }
  Future<void> _getPlayingNow(
      EventGetPlayingNowMovies event, Emitter<MoviesStates> emit) async {
    final result = await useCaseGetPlayingNowMovies(const NoParameter());
    result.fold((failure) {
      emit(StateGetPlayingNowMovies(
          message: failure.message, requestStates: RequestStates.error));
    }, (list) {
      emit(StateGetPlayingNowMovies(
        requestStates: RequestStates.success,
        list: list,
      ));
    });
  }

  Future<void> _getPopular(
      EventGetPopularMovies event, Emitter<MoviesStates> emit) async {
    final result = await useCaseGetPopularMovies(const NoParameter());
    result.fold((failure) {
      emit(StateGetPopularMovies(
          message: failure.message, requestStates: RequestStates.error));
    }, (list) {
      emit(StateGetPopularMovies(
        requestStates: RequestStates.success,
        list: list,
      ));
    });
  }

  Future<void> _getTopRated(
      EventGetTopRatedMovies event, Emitter<MoviesStates> emit) async {
    final result = await useCaseGetTopRatedMovies(const NoParameter());
    result.fold((failure) {
      emit(StateGetTopRatedMovies(
          message: failure.message, requestStates: RequestStates.error));
    }, (list) {
      emit(StateGetTopRatedMovies(
        requestStates: RequestStates.success,
        list: list,
      ));
    });
  }
}
