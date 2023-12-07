import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';

// ignore: must_be_immutable
class MoviesStates extends Equatable {
  List<MovieEntity> list;
  RequestStates requestStates;
  String message;
  int index;

  MoviesStates({
    this.list = const [],
    this.requestStates = RequestStates.loading,
    this.message = '',
    this.index = 0,
  });

  @override
  List<Object?> get props => [list, requestStates, message];
}

// ignore: must_be_immutable
class StateInitial extends MoviesStates {}

// ignore: must_be_immutable
class StateGetPlayingNowMovies extends MoviesStates {
  StateGetPlayingNowMovies({
    List<MovieEntity> list = const [],
    String message = '',
    RequestStates requestStates = RequestStates.loading,
    int index = 0,
  }) {
    this.list = list;
    this.message = message;
    this.requestStates = requestStates;
    this.index = index;
  }
}

// ignore: must_be_immutable
class StateGetPopularMovies extends MoviesStates {
  StateGetPopularMovies({
    List<MovieEntity> list = const [],
    String message = '',
    RequestStates requestStates = RequestStates.loading,
    int index = 0,
  }) {
    this.list = list;
    this.message = message;
    this.requestStates = requestStates;
    this.index = index;
  }
}

// ignore: must_be_immutable
class StateGetTopRatedMovies extends MoviesStates {
  StateGetTopRatedMovies({
    List<MovieEntity> list = const [],
    String message = '',
    RequestStates requestStates = RequestStates.loading,
    int index = 0,
  }) {
    this.list = list;
    this.message = message;
    this.requestStates = requestStates;
    this.index = index;
  }
}
