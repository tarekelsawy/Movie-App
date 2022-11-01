import 'package:get_it/get_it.dart';
import 'package:movie_app_with_clean_architecture/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_with_clean_architecture/movies/data/repo/movie_repo.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_details.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_recommendations.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_playing_now_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_popular_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_top_rated_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_details_bloc/movie_details_bloc.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///bloc
    getIt.registerFactory(() => MovieDetailsBloc(
        useCaseGetMovieDetails: getIt(),
        useCaseGetMovieRecommendations: getIt()));
    getIt.registerFactory(() => MovieBloc(
          useCaseGetPlayingNowMovies: getIt(),
          useCaseGetPopularMovies: getIt(),
          useCaseGetTopRatedMovies: getIt(),
          // useCaseGetMovieDetails: getIt(),
        ));

    ///USE CASE
    getIt.registerLazySingleton(() => UseCaseGetPlayingNowMovies(getIt()));
    getIt.registerLazySingleton(() => UseCaseGetPopularMovies(getIt()));
    getIt.registerLazySingleton(() => UseCaseGetTopRatedMovies(getIt()));
    getIt.registerLazySingleton(() => UseCaseGetMovieDetails(getIt()));
    getIt.registerLazySingleton(() => UseCaseGetMovieRecommendations(getIt()));

    ///REPO
    getIt.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(getIt()));

    /// DATA SOURCE
    getIt.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSource());
  }
}
