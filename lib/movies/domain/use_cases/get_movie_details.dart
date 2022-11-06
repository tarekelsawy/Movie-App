// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';

class UseCaseGetMovieDetails
    extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameter> {
  final BaseMovieRepo baseMovieRepo;

  UseCaseGetMovieDetails(this.baseMovieRepo);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(parameter) async {
    return await baseMovieRepo.getMovieDetails(parameter.id);
  }
}

class MovieDetailsParameter extends Equatable {
  final int id;
  const MovieDetailsParameter({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
