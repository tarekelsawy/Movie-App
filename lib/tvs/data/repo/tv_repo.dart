import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/data_source/tv_remote_data_source.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_details_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_episodes_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_recommended_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/repo/base_tv_repo.dart';

class TvRepo extends BaseTvRepo {
  final BaseRemoteTvDataSource baseRemoteTvDataSource;

  TvRepo(this.baseRemoteTvDataSource);

  @override
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTv() async {
    final result = await baseRemoteTvDataSource.getOnTheAirTv();
    try {
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getPopularTv() async {
    final result = await baseRemoteTvDataSource.getPopularTv();
    try {
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getTopRatedTv() async {
    final result = await baseRemoteTvDataSource.getTopRatedTv();
    try {
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetailsEntity>> getDetailsTv(int id) async {
    final result = await baseRemoteTvDataSource.getTvDetails(id);

    try {
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  List<Object> get props => [baseRemoteTvDataSource];

  @override
  Future<Either<Failure, List<TvEpisodesEntity>>> getEpisodesTv(
      {required int movieId, required int seasonNumber}) async {
    final result = await baseRemoteTvDataSource.getTvEpisodes(
        movieId: movieId, seasonNumber: seasonNumber);
    try {
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendedEntity>>> getRecommendedTv(
      int id) async {
    final result = await baseRemoteTvDataSource.getTvRecommendation(id);
    try {
      return Right(result);
    } on ServerException catch (serverException) {
      return Left(
          ServerFailure(serverException.movieErrorMessageModel.statusMessage));
    }
  }
}
