// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';
import 'package:movie_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/entities/movie_entity.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';

class UseCaseGetPlayingNowMovies extends BaseUsecase<List<MovieEntity>> {
  final BaseMovieRepo baseMovieRepo;

  UseCaseGetPlayingNowMovies(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await baseMovieRepo.getPlayingNowMovies();
  }
}


