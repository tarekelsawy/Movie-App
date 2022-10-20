import 'package:get_it/get_it.dart';
import 'package:movie_app_with_clean_architecture/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_with_clean_architecture/movies/data/repo/movie_repo.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_playing_now_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_popular_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_top_rated_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movies_bloc.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///bloc
    getIt.registerFactory(() => MovieBloc(useCaseGetPlayingNowMovies:getIt(),useCaseGetPopularMovies:getIt(),useCaseGetTopRatedMovies:getIt()));

    ///USE CASE
    getIt.registerLazySingleton(() => UseCaseGetPlayingNowMovies(getIt()));
    getIt.registerLazySingleton(() => UseCaseGetPopularMovies(getIt()));
    getIt.registerLazySingleton(() => UseCaseGetTopRatedMovies(getIt()));

    ///REPO
    getIt.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(getIt()));

    /// DATA SOURCE
    getIt.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSource());
  }
}
