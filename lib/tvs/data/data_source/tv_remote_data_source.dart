import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:movie_app_with_clean_architecture/core/network/error_message_model.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/model/tv_model.dart';

abstract class BaseRemoteTvDataSource extends Equatable {
  Future<List<TvModel>> getOnTheAirTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
}

class RemoteTvDataSource extends BaseRemoteTvDataSource {
  @override
  Future<List<TvModel>> getOnTheAirTv() async {
    final result =
        await Dio().get(ApiConstants.getTvOnTheAirUrl, queryParameters: {
      'api_key': ApiConstants.apiKey,
    });
    if (result.statusCode == 200) {
      return (result.data['results'] as List)
          .map((tv) => TvModel.fromJson(tv))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    final result =
        await Dio().get(ApiConstants.getTvPopularUrl, queryParameters: {
      'api_key': ApiConstants.apiKey,
    });
    if (result.statusCode == 200) {
      return (result.data['results'] as List)
          .map((tv) => TvModel.fromJson(tv))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    final result =
        await Dio().get(ApiConstants.getTvTopRatedUrl, queryParameters: {
      'api_key': ApiConstants.apiKey,
    });
    if (result.statusCode == 200) {
      return (result.data['results'] as List)
          .map((tv) => TvModel.fromJson(tv))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  List<Object?> get props => [];
}
