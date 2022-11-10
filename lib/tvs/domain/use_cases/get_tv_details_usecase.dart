import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_details_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/repo/base_tv_repo.dart';

class UseCaseGetDetailsTv
    extends BaseUseCase<TvDetailsEntity, MovieDetailsParameter> {
  final BaseTvRepo baseTvRepo;

  UseCaseGetDetailsTv(this.baseTvRepo);
  @override
  Future<Either<Failure, TvDetailsEntity>> call(
      MovieDetailsParameter parameter) async {
    return await baseTvRepo.getDetailsTv(parameter.id);
  }
}

class MovieDetailsParameter extends Equatable {
  final int id;

  const MovieDetailsParameter(this.id);

  @override
  List<Object> get props => [id];
}
