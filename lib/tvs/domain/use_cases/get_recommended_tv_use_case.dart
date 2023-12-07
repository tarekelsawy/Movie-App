import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_recommended_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/repo/base_tv_repo.dart';

class UseCaseGetRecommendedTv
    extends BaseUseCase<List<TvRecommendedEntity>, RecommendedTvParameter> {
  final BaseTvRepo baseTvRepo;

  UseCaseGetRecommendedTv(this.baseTvRepo);

  @override
  Future<Either<Failure, List<TvRecommendedEntity>>> call(
      RecommendedTvParameter parameter) async {
    return await baseTvRepo.getRecommendedTv(parameter.id);
  }
}

class RecommendedTvParameter extends Equatable {
  final int id;

  const RecommendedTvParameter(this.id);

  @override
  List<Object> get props => [id];
}
