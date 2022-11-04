// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';

class MovieSearchState extends Equatable {
  final String message;
  final List<MovieEntity> movies;
  RequestStates requestStates;

  MovieSearchState({
    this.message = '',
    this.movies = const [],
    this.requestStates = RequestStates.loading,
  });

  MovieSearchState copyWith({
    String? message,
    List<MovieEntity>? movies,
    RequestStates? requestStates,
  }) {
    return MovieSearchState(
      message: message ?? this.message,
      movies: movies ?? this.movies,
      requestStates: requestStates ?? this.requestStates,
    );
  }

  @override
  List<Object> get props => [message, movies, requestStates];
}
