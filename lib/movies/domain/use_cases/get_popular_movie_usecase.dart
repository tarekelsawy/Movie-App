import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_playing_now_movie_usecase.dart';

class UseCaseGetPopularMovies
    extends BaseMovieUseCase<List<MovieEntity>, NoParameter> {
  BaseMovieRepo baseMovieRepo;
  UseCaseGetPopularMovies(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(parameter) async {
    return await baseMovieRepo.getPopularMovies();
  }
}
