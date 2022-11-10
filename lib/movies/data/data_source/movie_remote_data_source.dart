import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:movie_app_with_clean_architecture/core/network/error_message_model.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/movies/data/model/movie_details_model.dart';
import 'package:movie_app_with_clean_architecture/movies/data/model/movie_model.dart';
import 'package:movie_app_with_clean_architecture/movies/data/model/movie_recommendations_model.dart';
import 'package:movie_app_with_clean_architecture/movies/domain/use_cases/get_movie_recommendations.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getPlayingNowMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(
      MovieRecommendationsParameter parameter);
  Future<List<MovieModel>> getMovieSearch(String searchQuery);
}

class RemoteMovieDataSource implements BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getPlayingNowMovies() async {
    print('data source details');
    var response = await Dio().get(
      ApiConstants.baseURL + ApiConstants.endPointPlayingNow,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
      },
    ).catchError((onError) {
      print('catch error ${onError.toString()}');
    });

    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((movieJson) =>
              MovieModel.fromJson(movieJson as Map<String, dynamic>))
          .toList();
    } else {
      //?YOU FORGET THIS
      throw ServerException(MovieErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var response = await Dio().get(
      ApiConstants.baseURL + ApiConstants.endPointPopular,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
      },
    ).catchError((onError) {
      print('onPopularError:${onError.toString()}');
    });
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var response = await Dio().get(
      ApiConstants.baseURL + ApiConstants.endPointTopRated,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
      },
    ).catchError((onError) {
      print('onPopularError:${onError.toString()}');
    });
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final result = await Dio().get(
      ApiConstants.getMovieDetailsPath(movieId),
      queryParameters: {
        'api_key': ApiConstants.apiKey,
      },
    ).catchError((onError) {
      print('on details Error:${onError.toString()}');
    });
    if (result.statusCode == 200) {
      log('success 200 data source movie details');
      return MovieDetailsModel.fromJson(result.data);
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(
      MovieRecommendationsParameter parameter) async {
    final result = await Dio().get(
      ApiConstants.getMovieRecommendationsPath(parameter.id),
      queryParameters: {
        'api_key': ApiConstants.apiKey,
      },
    );

    if (result.statusCode == 200) {
      log('status code 200 data source recommendation');
      return (result.data['results'] as List)
          .map((recommend) => MovieRecommendationsModel.fromJson(recommend))
          .toList();
    } else {
      throw ServerException(result.data);
    }
  }

  @override
  Future<List<MovieModel>> getMovieSearch(String searchQuery) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
    final result = await dio.get(
      ApiConstants.getMovieSearch,
      queryParameters: {
        'api_key': ApiConstants.apiKey,
        'query': searchQuery,
      },
    );
    if (result.statusCode == 200) {
      return (result.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
    }
  }
}
