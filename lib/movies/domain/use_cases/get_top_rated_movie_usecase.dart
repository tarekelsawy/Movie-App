// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';

class UseCaseGetTopRatedMovies extends BaseUsecase<List<MovieEntity>>{
  BaseMovieRepo baseMovieRepo;
  UseCaseGetTopRatedMovies(this.baseMovieRepo);
  @override
  Future<Either<Failure,List<MovieEntity>>> call() async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}
