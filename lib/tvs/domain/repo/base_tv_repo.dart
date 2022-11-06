import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_entity.dart';

abstract class BaseTvRepo extends Equatable {
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTv();
  Future<Either<Failure, List<TvEntity>>> getPopularTv();
  Future<Either<Failure, List<TvEntity>>> getTopRatedTv();
}
