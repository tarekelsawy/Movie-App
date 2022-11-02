import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_recommendations_entity.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<MovieEntity>>> getPlayingNowMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);
  Future<Either<Failure, List<MovieRecommendationsEntity>>>
      getMovieRecommendations(int movieId);
  Future<Either<Failure, List<MovieEntity>>> getMovieSearch(String searchQuery);
}
