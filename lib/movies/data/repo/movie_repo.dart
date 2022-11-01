import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_recommendations_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_recommendations.dart';

class MovieRepo implements BaseMovieRepo {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;
  MovieRepo(this.baseRemoteMovieDataSource);
  @override
  Future<Either<Failure, List<MovieEntity>>> getPlayingNowMovies() async {
    final response = await baseRemoteMovieDataSource.getPlayingNowMovies();
    try {
      return Right(response);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final response = await baseRemoteMovieDataSource.getPopularMovies();
    try {
      return Right(response);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final response = await baseRemoteMovieDataSource.getTopRatedMovies();
    try {
      return Right(response);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      int movieId) async {
    print('repo details');
    final result = await baseRemoteMovieDataSource.getMovieDetails(movieId);
    try {
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendationsEntity>>>
      getMovieRecommendations(int movieId) async {
    log('success fold2');
    final result = await baseRemoteMovieDataSource
        .getMovieRecommendations(MovieRecommendationsParameter(movieId));
    try {
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }
}
