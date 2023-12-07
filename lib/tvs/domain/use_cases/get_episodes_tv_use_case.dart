import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_episodes_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/repo/base_tv_repo.dart';

class UseCaseGetEpisodesTv
    extends BaseUseCase<List<TvEpisodesEntity>, EpisodesTvParameter> {
  final BaseTvRepo baseTvRepo;

  UseCaseGetEpisodesTv(this.baseTvRepo);
  @override
  Future<Either<Failure, List<TvEpisodesEntity>>> call(
      EpisodesTvParameter parameter) async {
    return await baseTvRepo.getEpisodesTv(
        movieId: parameter.tvId, seasonNumber: parameter.seasonNumber);
  }
}

class EpisodesTvParameter extends Equatable {
  final int tvId;
  final int seasonNumber;

  const EpisodesTvParameter({
    required this.tvId,
    required this.seasonNumber,
  });

  @override
  List<Object> get props => [tvId, seasonNumber];
}
