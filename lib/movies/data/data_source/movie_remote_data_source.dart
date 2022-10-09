import 'package:dio/dio.dart';
import 'package:movie_app_with_clean_architecture/core/constances/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:movie_app_with_clean_architecture/core/network/error_message_model.dart';
import 'package:movie_app_with_clean_architecture/movies/data/model/movie_model.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getPlayingNowMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class RemoteMovieDataSource implements BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getPlayingNowMovies() async {
    var response = await Dio().get(
      Constances.baseURL + Constances.endPointPlayingNow,
      queryParameters: {
        'api_key': Constances.apiKey,
      },
    ).catchError((onError) {
      print('catch error ${onError.toString()}');
    });
    
    if (response.statusCode == 200) {
      return (response.data['results'] as List).map((movieJson) => MovieModel.fromJson(movieJson as Map<String, dynamic>)
      ).toList();
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
      return (response.data as List)
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
      return (response.data as List)
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(response.data));
    }
  }
}
