import 'package:get_it/get_it.dart';
import 'package:movie_app_with_clean_architecture/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_with_clean_architecture/movies/data/repo/movie_repo.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/repo/base_movie_repo.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_details.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_recommendations.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_search.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_playing_now_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_popular_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_top_rated_movie_usecase.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_bloc/movies_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_app_with_clean_architecture/movies/presentation/controller/bloc/movie_search_bloc/movie_search_bloc.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/data_source/tv_remote_data_source.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/repo/tv_repo.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/repo/base_tv_repo.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_episodes_tv_use_case.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_on_the_air_tv_usecase.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_popular_tv_usecase.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_recommended_tv_use_case.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_tv_details_usecase.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/use_cases/get_tv_top_rated_tv.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/bloc/tv_bloc/tv_bloc.dart';
import 'package:movie_app_with_clean_architecture/tvs/presentation/controller/bloc/tv_details_bloc/tv_details_bloc.dart';

GetIt movieServiceLocator = GetIt.instance;
GetIt tvServiceLocator = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///bloc
    ///tv
    tvServiceLocator.registerFactory(() => TvDetailsBloc(
        tvServiceLocator(), tvServiceLocator(), tvServiceLocator()));
    tvServiceLocator.registerFactory(() =>
        TvBloc(tvServiceLocator(), tvServiceLocator(), tvServiceLocator()));

    ///movie
    movieServiceLocator
        .registerFactory(() => MovieSearchBloc(movieServiceLocator()));
    movieServiceLocator.registerFactory(() => MovieDetailsBloc(
        useCaseGetMovieDetails: movieServiceLocator(),
        useCaseGetMovieRecommendations: movieServiceLocator()));
    movieServiceLocator.registerFactory(() => MovieBloc(
          useCaseGetPlayingNowMovies: movieServiceLocator(),
          useCaseGetPopularMovies: movieServiceLocator(),
          useCaseGetTopRatedMovies: movieServiceLocator(),
        ));

    ///USE CASE
    ///tv
    tvServiceLocator.registerLazySingleton(
        () => UseCaseGetRecommendedTv(tvServiceLocator()));
    tvServiceLocator
        .registerLazySingleton(() => UseCaseGetEpisodesTv(tvServiceLocator()));
    tvServiceLocator
        .registerLazySingleton(() => UseCaseGetDetailsTv(tvServiceLocator()));
    tvServiceLocator
        .registerLazySingleton(() => UseCaseGetOnTheAirTv(tvServiceLocator()));
    tvServiceLocator
        .registerLazySingleton(() => UseCaseGetPopularTv(tvServiceLocator()));
    tvServiceLocator
        .registerLazySingleton(() => UseCaseGetTopRatedTv(tvServiceLocator()));

    ///movie
    movieServiceLocator.registerLazySingleton(
        () => UseCaseGetPlayingNowMovies(movieServiceLocator()));
    movieServiceLocator.registerLazySingleton(
        () => UseCaseGetPopularMovies(movieServiceLocator()));
    movieServiceLocator.registerLazySingleton(
        () => UseCaseGetTopRatedMovies(movieServiceLocator()));
    movieServiceLocator.registerLazySingleton(
        () => UseCaseGetMovieDetails(movieServiceLocator()));
    movieServiceLocator.registerLazySingleton(
        () => UseCaseGetMovieRecommendations(movieServiceLocator()));
    movieServiceLocator.registerLazySingleton(
        () => UseCaseGetMovieSearch(movieServiceLocator()));

    ///REPO
    ///tv
    tvServiceLocator
        .registerLazySingleton<BaseTvRepo>(() => TvRepo(tvServiceLocator()));

    ///movie
    movieServiceLocator.registerLazySingleton<BaseMovieRepo>(
        () => MovieRepo(movieServiceLocator()));

    /// DATA SOURCE
    /// tv
    tvServiceLocator.registerLazySingleton<BaseRemoteTvDataSource>(
        () => RemoteTvDataSource());

    /// movie
    movieServiceLocator.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSource());
  }
}
