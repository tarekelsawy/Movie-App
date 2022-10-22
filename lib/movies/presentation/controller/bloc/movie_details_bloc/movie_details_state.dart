// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_recommendations_entity.dart';

abstract class MovieDetailsStates extends Equatable {
  final String message;
  final RequestStates requestStates;

  const MovieDetailsStates({
    this.message = '',
    this.requestStates = RequestStates.loading,
  });

  @override
  List<Object> get props => [message, requestStates];
}

class MovieDetailsInitialState extends MovieDetailsStates {}

class StateGetMovieDetails extends MovieDetailsStates {
  final MovieDetailsEntity? movieDetails;
  const StateGetMovieDetails({
    super.message,
    super.requestStates,
    this.movieDetails,
  });
}

class StateGetMovieRecommendations extends MovieDetailsStates {
  final List<MovieRecommendationsEntity> movieRecommendationsEntity;
  const StateGetMovieRecommendations({
    super.message,
    this.movieRecommendationsEntity = const [],
    super.requestStates,
  });
}
