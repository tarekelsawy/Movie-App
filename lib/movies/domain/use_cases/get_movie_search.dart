import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';

class UseCaseGetMovieSearch
    extends BaseMovieUseCase<List<MovieEntity>, MovieSearchParameter> {
  final BaseMovieRepo baseMovieRepo;

  UseCaseGetMovieSearch(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      MovieSearchParameter parameter) async {
    return await baseMovieRepo.getMovieSearch(parameter.searchQuery);
  }
}

class MovieSearchParameter extends Equatable {
  final String searchQuery;

  const MovieSearchParameter({required this.searchQuery});

  @override
  List<Object> get props => [searchQuery];
}
