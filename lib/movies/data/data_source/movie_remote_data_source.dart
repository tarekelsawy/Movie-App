import 'package:dio/dio.dart';
import 'package:movie_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:movie_app_with_clean_architecture/core/network/error_message_model.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/movies/data/model/movie_details_model.dart';
import 'package:movie_app_with_clean_architecture/movies/data/model/movie_model.dart';
import 'package:movie_app_with_clean_architecture/movies/data/model/movie_recommendations_model.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getPlayingNowMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(int movieId);
}

class RemoteMovieDataSource implements BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getPlayingNowMovies() async {
    print('data source details');
    var response = await Dio().get(
      Constances.baseURL + Constances.endPointPlayingNow,
      queryParameters: {
        'api_key': Constances.apiKey,
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
      Constances.baseURL + Constances.endPointPopular,
      queryParameters: {
        'api_key': Constances.apiKey,
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
      Constances.baseURL + Constances.endPointTopRated,
      queryParameters: {
        'api_key': Constances.apiKey,
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
      Constances.getMovieDetailsPath(movieId),
      queryParameters: {
        'api_key': Constances.apiKey,
      },
    ).catchError((onError) {
      print('on details Error:${onError.toString()}');
    });
    if (result.statusCode == 200) {
      print('success 200');
      return MovieDetailsModel.fromJson(result.data);
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  Future<List<MovieRecommendationsModel>> getMovieRecommendations(
      int movieId) async {
    final result = await Dio().get(
      Constances.getMovieRecommendationsPath(movieId),
      queryParameters: {
        'api_key': Constances.apiKey,
      },
    );

    if (result.statusCode == 200) {
      print('status code 200');
      return (result.data['results'] as List)
          .map((recommend) => MovieRecommendationsModel.fromJson(recommend))
          .toList();
    } else {
      throw ServerException(result.data);
    }
  }
}
