import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/core/utils/no_parameter_class.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_entity.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/repo/base_tv_repo.dart';

class UseCaseGetTopRatedTv extends BaseUseCase<List<TvEntity>, NoParameter> {
  BaseTvRepo baseTvRepo;

  UseCaseGetTopRatedTv(this.baseTvRepo);

  @override
  Future<Either<Failure, List<TvEntity>>> call(NoParameter parameter) async {
    return await baseTvRepo.getTopRatedTv();
  }
}
