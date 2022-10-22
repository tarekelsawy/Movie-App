// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsStates extends Equatable {
  final String message;
  final RequestStates requestStates;
  final MovieDetailsEntity movieDetails;
  const MovieDetailsStates({
    this.message = '',
    this.requestStates = RequestStates.loading,
    this.movieDetails =const MovieDetailsEntity(
      backdropPath: '',
      genres: [],
      id: 345,
      overview: '',
      releaseDate: '',
      runtime: 0,
      title: '',
      voteAverage: 0.0,
    ),
  });

  @override
  List<Object> get props => [message, requestStates, movieDetails];
}

class MovieDetailsInitialState extends MovieDetailsStates {}

class StateGetMovieDetails extends MovieDetailsStates {
  const StateGetMovieDetails({
    super.message,
    super.requestStates,
    super.movieDetails,
  });
}

class StateGetMovieRecommendations extends MovieDetailsStates {
  const StateGetMovieRecommendations({
    super.message,
    super.movieDetails,
    super.requestStates,
  });
}
