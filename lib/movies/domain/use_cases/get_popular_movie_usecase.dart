import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';

class UseCaseGetPopularMovies {
  BaseMovieRepo baseMovieRepo;
  UseCaseGetPopularMovies(this.baseMovieRepo);

  Future<Either<Failure,List<MovieEntity>>> useCaseGetData()async{
    return await baseMovieRepo.getPopularMovies();
  }
}
