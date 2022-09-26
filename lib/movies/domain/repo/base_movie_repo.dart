import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure,List<MovieEntity>>> getPlayingNowMovies();
  Future<Either<Failure,List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure,List<MovieEntity>>> getTopRatedMovies();
  
}