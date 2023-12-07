import 'package:movie_app_with_clean_architecture/tvs/data/model/tv_details_genres_model.dart';
import 'package:movie_app_with_clean_architecture/tvs/data/model/tv_season_number_model.dart';
import 'package:movie_app_with_clean_architecture/tvs/domain/entities/tv_details_entity.dart';

// ignore: must_be_immutable
class TvDetailsModel extends TvDetailsEntity {
  TvDetailsModel({
    required super.id,
    required super.seasonsNumber,
    super.backdropPath,
    required super.firstAirDate,
    required super.name,
    required super.overview,
    required super.voteAverage,
    required super.genres,
    required super.episodeRunTime,
    required super.numberOfSeasons,
  });
  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsModel(
      id: json['id'],
      seasonsNumber: (json['seasons'] as List)
          .map((season) => TvSeasonNumberModel.fromJson(season))
          .toList(),
      firstAirDate: json['first_air_date'],
      name: json['name'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      genres: (json['genres'] as List)
          .map((genre) => TvDetailsGenresModel.fromJson(genre))
          .toList(),
      episodeRunTime: (json['episode_run_time'] as List).map((e) => e).toList().isEmpty?100:(json['episode_run_time'] as List).map((e) => e).toList()[0],
      numberOfSeasons: json['number_of_seasons'],
      backdropPath: json['backdrop_path'],
    );
  }
}
