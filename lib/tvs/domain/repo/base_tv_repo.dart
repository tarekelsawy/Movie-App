import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_details_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_episodes_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_recommended_entity.dart';

abstract class BaseTvRepo extends Equatable {
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTv();
  Future<Either<Failure, List<TvEntity>>> getPopularTv();
  Future<Either<Failure, List<TvEntity>>> getTopRatedTv();
  Future<Either<Failure, TvDetailsEntity>> getDetailsTv(int id);
  Future<Either<Failure, List<TvEpisodesEntity>>> getEpisodesTv(
      {required int movieId, required int seasonNumber});
  Future<Either<Failure, List<TvRecommendedEntity>>> getRecommendedTv(int id);
}
