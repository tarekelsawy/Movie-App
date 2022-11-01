import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/genres.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_recommendations_entity.dart';

abstract class MovieDetailsStates extends Equatable {
  final String message;
  final RequestStates requestStates;
  final List<MovieRecommendationsEntity> movieRecommendationsEntity;
  final MovieDetailsEntity movieDetails;

  const MovieDetailsStates({
    this.movieRecommendationsEntity = const [],
    this.message = '',
    this.requestStates = RequestStates.loading,
    this.movieDetails = const MovieDetailsEntity(
      genres: <Genres>[
        Genres(id: 11, name: 'name'),
        Genres(id: 11, name: 'name'),
        Genres(id: 11, name: 'name'),
        Genres(id: 11, name: 'name'),
      ],
      id: 616820,
      overview:
          'overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview overview ',
      releaseDate: '2022-12-12',
      runtime: 122,
      title: 'edge of tomorrow',
      voteAverage: 7.5,
      backdropPath: '/A0Ei3qp7K3BFMyXgXq77VEYwEqU.jpg',
    ),
  });

  @override
  List<Object> get props => [
        message,
        requestStates,
        movieRecommendationsEntity,
        movieDetails,
      ];
}

class MovieDetailsInitialState extends MovieDetailsStates {}

class StateGetMovieDetails extends MovieDetailsStates {
  const StateGetMovieDetails({
    super.movieDetails,
    super.requestStates,
    super.message,
  });
}

class StateGetMovieRecommendations extends MovieDetailsStates {
  const StateGetMovieRecommendations({
    super.requestStates,
    super.message,
    super.movieRecommendationsEntity,
  });
}
