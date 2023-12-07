import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_with_clean_architecture/core/error/exceptions.dart';
import 'package:movie_app_with_clean_architecture/core/network/error_message_model.dart';
import 'package:movie_app_with_clean_architecture/core/utils/api_constances.dart';
import 'package:movie_app_with_clean_architecture/core/utils/app_strings.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/model/tv_details_model.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/model/tv_episodes_model.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/model/tv_model.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/model/tv_recommended_model.dart';

abstract class BaseRemoteTvDataSource extends Equatable {
  Future<List<TvModel>> getOnTheAirTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
  Future<TvDetailsModel> getTvDetails(int id);
  Future<List<TvEpisodesModel>> getTvEpisodes(
      {required int movieId, required int seasonNumber});
  Future<List<TvRecommendedModel>> getTvRecommendation(int movieId);
}

class RemoteTvDataSource extends BaseRemoteTvDataSource {
  @override
  Future<List<TvModel>> getOnTheAirTv() async {
    final result =
        await Dio().get(ApiConstants.getTvOnTheAirUrl, queryParameters: {
      AppStrings.apiKey: ApiConstants.apiKey,
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
      AppStrings.apiKey: ApiConstants.apiKey,
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
      AppStrings.apiKey: ApiConstants.apiKey,
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
  Future<TvDetailsModel> getTvDetails(int id) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
    final result = await dio.get(
      ApiConstants.getTvDetails(id),
      queryParameters: {
        AppStrings.apiKey: ApiConstants.apiKey,
      },
    );
    if (result.statusCode == 200) {
      return TvDetailsModel.fromJson(result.data);
      
    } else {

      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
      
    }
  }

  @override
  Future<List<TvEpisodesModel>> getTvEpisodes(
      {required int movieId, required int seasonNumber}) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
    final result = await dio.get(
      ApiConstants.getTvEpisodes(movieId: movieId, seasonNumber: seasonNumber),
      queryParameters: {
        AppStrings.apiKey: ApiConstants.apiKey,
      },
    );
    if (result.statusCode == 200) {
      return (result.data['episodes'] as List)
          .map((episode) => TvEpisodesModel.fromJson(episode))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  Future<List<TvRecommendedModel>> getTvRecommendation(int movieId) async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));

    final result = await dio
        .get(ApiConstants.getTvRecommendation(movieId), queryParameters: {
      AppStrings.apiKey: ApiConstants.apiKey,
    });
    if (result.statusCode == 200) {
      return (result.data['results'] as List)
          .map((recommendedTv) => TvRecommendedModel.fromJson(recommendedTv))
          .toList();
    } else {
      throw ServerException(MovieErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  List<Object?> get props => [];
}
