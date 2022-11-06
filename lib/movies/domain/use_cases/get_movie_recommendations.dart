import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_recommendations_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';

class UseCaseGetMovieRecommendations extends BaseUseCase<
    List<MovieRecommendationsEntity>, MovieRecommendationsParameter> {
  final BaseMovieRepo baseMovieRepo;

  UseCaseGetMovieRecommendations(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<MovieRecommendationsEntity>>> call(
      MovieRecommendationsParameter parameter) async {
    return await baseMovieRepo.getMovieRecommendations(parameter.id);
  }
}

class MovieRecommendationsParameter extends Equatable {
  final int id;

  const MovieRecommendationsParameter(this.id);

  @override
  List<Object?> get props => [id];
}
