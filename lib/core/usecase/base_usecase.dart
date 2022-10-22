import 'package:dartz/dartz.dart';
import 'package:movie_app_with_clean_architecture/core/error/failure.dart';

abstract class BaseMovieUsecase<T,parameter> {
  Future<Either<Failure, T>> call(parameter);
}
    